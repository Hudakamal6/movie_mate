import '../../../../core/models/movie_hive_model.dart';

abstract class FavoritesLocalDataSource {
  Future<void> addToFavorites(MovieHiveModel movie);
  Future<void> removeFromFavorites(int movieId);
  Future<List<MovieHiveModel>> getFavorites();
  Future<bool> isFavorite(int movieId);
}

