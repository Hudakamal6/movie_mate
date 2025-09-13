import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MovieDetailsRepo  {
  Future<Either<Failure, MovieEntity>> getMovieDetails(int movieId);

}