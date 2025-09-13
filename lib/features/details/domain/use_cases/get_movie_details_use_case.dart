import 'package:dartz/dartz.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/error/failure.dart';
import '../repositories/movie_details_repo.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsRepo repo;

  GetMovieDetailsUseCase({required this.repo});

  Future<Either<Failure, MovieEntity>> getMovieDetails(int movieId) async {
    return await repo.getMovieDetails(movieId);
  }
}
