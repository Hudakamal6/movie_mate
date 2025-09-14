import 'dart:async';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movie_mate_app/core/models/movie_hive_model_extension.dart';
import 'package:movie_mate_app/core/network/netwrok_statues.dart';
import 'package:movie_mate_app/features/home/data/data_sources/local/movies_local_data_source.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/movies_response_entity.dart';
import '../../domain/repositories/movies_repo.dart';
import '../data_sources/remote/movies_remote_data_source.dart';

class MoviesRepoImpl implements MoviesRepo {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;
  final Dio dio;

  MoviesRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.dio,
  });

  @override
  Future<Either<Failure, MoviesResponseEntity>> getMovies(int pageNum) async {
    try {
      final result = await remoteDataSource.getMovies(pageNum);

      if (pageNum == 1) {
        unawaited(_cacheFirstTenMovies(result.moviesList));
      }

      return Right(result);
    } on Failure catch (e) {
      if (e is NetworkFailure) {
        try {
          final cachedResult = await localDataSource.getCachedMovies();
          final cachedMovies = cachedResult.map((m) => m.toEntity()).toList();

          return Right(
            MoviesResponseEntity(
              moviesList: cachedMovies,
              totalPages: 0,
              page: 0,
            ),
          );
        } catch (cacheError) {
          return Left(
              CacheFailure('Failed to read cached movies: $cacheError'));
        }
      }

      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch movies: $e'));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseEntity>> searchForMovieByMovieName(
      String movieName) async {
    try {
      final result =
          await remoteDataSource.searchForMovieByMovieName(movieName);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  Future<void> _cacheFirstTenMovies(List<MovieEntity> movies) async {
    try {
      final futures = movies.map((movie) async {
        Uint8List? imageBytes;

        if (movie.movieImage != null && movie.movieImage!.isNotEmpty) {
          try {
            final response = await dio.get<List<int>>(
              Constants.imageBaseUrl + movie.movieImage!,
              options: Options(responseType: ResponseType.bytes),
            );
            imageBytes = Uint8List.fromList(response.data!);
          } catch (_) {}
        }

        return movie.toHiveModel(imageBytes);
      }).toList();

      final hiveMovies = await Future.wait(futures);
      await localDataSource.cacheMovies(hiveMovies);
    } catch (_) {}
  }
}
