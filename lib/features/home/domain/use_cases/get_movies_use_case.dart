import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movies_response_entity.dart';
import '../repositories/movies_repo.dart';

class GetMoviesUseCase {
  final MoviesRepo repo;

  GetMoviesUseCase({required this.repo});

  Future<Either<Failure, MoviesResponseEntity>> getMovies(int pageNum) async {
    return await repo.getMovies(pageNum);
  }
}
