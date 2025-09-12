import 'package:dartz/dartz.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import '../repositories/movies_repo.dart';

class GetMovieDetailsUseCase {
  final MoviesRepo repo;

  GetMovieDetailsUseCase({required this.repo});

  Future<Either<Failure, MovieEntity>> getMovies(int movieId) async {
    return await repo.getMovieDetails(movieId);
  }
}
