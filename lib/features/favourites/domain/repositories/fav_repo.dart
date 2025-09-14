import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/movie_hive_model.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class FavoritesRepo {
  /// Add a movie to favorites
  Future<Either<Failure, void>> addToFavorites(MovieEntity movie);

  /// Remove a movie from favorites
  Future<Either<Failure, void>> removeFromFavorites(int movieId);

  /// Get all favorite movies
  Future<Either<Failure, List<MovieHiveModel>>> getFavorites();

  /// Check if a movie is already in favorites
  Future<Either<Failure, bool>> isFavorite(int movieId);
}
