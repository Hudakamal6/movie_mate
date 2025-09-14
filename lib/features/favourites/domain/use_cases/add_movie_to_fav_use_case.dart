import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/fav_repo.dart';


class AddToFavoritesUseCase {
  final FavoritesRepo repo;

  AddToFavoritesUseCase(this.repo);

  Future<Either<Failure, void>> call(MovieEntity movie) {
    return repo.addToFavorites(movie);
  }
}
