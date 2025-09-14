import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/fav_repo.dart';

class IsFavoriteUseCase {
  final FavoritesRepo repo;

  IsFavoriteUseCase(this.repo);

  Future<Either<Failure, bool>> call(int movieId) {
    return repo.isFavorite(movieId);
  }
}
