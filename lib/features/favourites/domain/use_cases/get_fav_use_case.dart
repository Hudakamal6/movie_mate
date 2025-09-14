import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/movie_hive_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/fav_repo.dart';

class GetFavoritesUseCase {
  final FavoritesRepo repo;

  GetFavoritesUseCase(this.repo);

  Future<Either<Failure, List<MovieHiveModel>>> call() {
    return repo.getFavorites();
  }
}
