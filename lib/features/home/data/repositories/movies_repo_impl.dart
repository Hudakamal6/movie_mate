

import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/movies_response_entity.dart';
import '../../domain/repositories/movies_repo.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/movies_remote_data_source.dart';

class MoviesRepoImpl implements MoviesRepo {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, MoviesResponseEntity>> getMovies(int pageNum) async {
    try {
      final result = await remoteDataSource.getMovies(pageNum);
      return Right(result);
    }  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> getMovieDetails(int movieId) async{
    try {
      final result = await remoteDataSource.getMovieDetails(movieId);
      return Right(result);
    }  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseEntity>> searchForMovieByMovieName(String movieName)async {
    try {
      final result = await remoteDataSource.searchForMovieByMovieName(movieName);
      return Right(result);
    }  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
