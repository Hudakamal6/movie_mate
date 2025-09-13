import 'package:hive/hive.dart';

import '../models/movie_hive_model.dart';
import 'fav_local_data_source.dart';

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String boxName = "favoritesBox";

  @override
  Future<void> addToFavorites(MovieHiveModel movie) async {
    final box = await Hive.openBox<MovieHiveModel>(boxName);
    await box.put(movie.movieId, movie);
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    final box = await Hive.openBox<MovieHiveModel>(boxName);
    await box.delete(movieId);
  }

  @override
  Future<List<MovieHiveModel>> getFavorites() async {
    final box = await Hive.openBox<MovieHiveModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final box = await Hive.openBox<MovieHiveModel>(boxName);
    return box.containsKey(movieId);
  }
}