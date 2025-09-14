import '../../../../core/error/failure.dart';
import '../entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepo {
  Future<Either<Failure, MoviesResponseEntity>> getMovies(int pageNum);

  Future<Either<Failure, MoviesResponseEntity>> searchForMovieByMovieName(
      String movieName);
}
