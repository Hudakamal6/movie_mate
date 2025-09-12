import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import '../entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepo  {
  Future<Either<Failure, MoviesResponseEntity>> getMovies();
  Future<Either<Failure, MovieEntity>> getMovieDetails(int movieId);

}