import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movies_response_entity.dart';
import '../repositories/movies_repo.dart';

class SearchByMovieNameUseCase {
  final MoviesRepo repo;

  SearchByMovieNameUseCase({required this.repo});

  Future<Either<Failure, MoviesResponseEntity>> searchForMovieByMovieName(
      String movieName) async {
    return await repo.searchForMovieByMovieName(movieName);
  }
}
