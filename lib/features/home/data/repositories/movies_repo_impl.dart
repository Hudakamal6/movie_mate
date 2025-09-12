

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
  Future<Either<Failure, MoviesResponseEntity>> getMovies() async {
    try {
      final result = await remoteDataSource.getMovies();
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
}
