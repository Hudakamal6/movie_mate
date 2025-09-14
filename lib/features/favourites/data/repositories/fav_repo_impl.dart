import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/core/models/movie_hive_model_extension.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/movie_hive_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/fav_repo.dart';
import '../data_sources/fav_local_data_source.dart';
import 'package:dio/dio.dart';



class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesLocalDataSource localDataSource;
  final Dio dio;

  FavoritesRepoImpl({required this.localDataSource, required this.dio});

  @override
  @override
  Future<Either<Failure, void>> addToFavorites(MovieEntity movie) async {
    try {
      Uint8List? imageBytes;

      if (movie.movieImage != null && movie.movieImage!.isNotEmpty) {
        // Only download if URL exists
        final response = await dio.get<List<int>>(
          Constants.imageBaseUrl + movie.movieImage!,
          options: Options(responseType: ResponseType.bytes),
        );

        imageBytes = Uint8List.fromList(response.data!);
      }

      final hiveModel = movie.toHiveModel(imageBytes); // will be null if no image
      await localDataSource.addToFavorites(hiveModel);

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, void>> removeFromFavorites(int movieId) async {
    try {
      await localDataSource.removeFromFavorites(movieId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieHiveModel>>> getFavorites() async {
    try {
      final result = await localDataSource.getFavorites();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, bool>> isFavorite(int movieId) async {
    try {
      final result = await localDataSource.isFavorite(movieId);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure( e.toString()));
    }
  }
}
