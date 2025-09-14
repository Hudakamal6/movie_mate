import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/fav_repo.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepo repo;

  RemoveFromFavoritesUseCase(this.repo);

  Future<Either<Failure, void>> call(int movieId) {
    return repo.removeFromFavorites(movieId);
  }
}
