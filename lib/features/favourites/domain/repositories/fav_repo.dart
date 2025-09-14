import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/movie_hive_model.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, void>> addToFavorites(MovieEntity movie);

  Future<Either<Failure, void>> removeFromFavorites(int movieId);

  Future<Either<Failure, List<MovieHiveModel>>> getFavorites();

  Future<Either<Failure, bool>> isFavorite(int movieId);
}
