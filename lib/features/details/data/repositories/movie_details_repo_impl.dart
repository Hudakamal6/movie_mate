

import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../home/data/data_sources/remote/movies_remote_data_source.dart';
import '../../domain/repositories/movie_details_repo.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/movie_details_remote_data_source.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MoviesRemoteDataSource remoteDataSource;

  MovieDetailsRepoImpl({required this.remoteDataSource});


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
