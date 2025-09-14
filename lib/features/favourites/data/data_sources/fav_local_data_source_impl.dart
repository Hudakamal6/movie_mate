import 'package:hive/hive.dart';
import 'package:movie_mate_app/core/constants/constants.dart';

import '../../../../core/models/movie_hive_model.dart';
import 'fav_local_data_source.dart';

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {

  @override
  Future<void> addToFavorites(MovieHiveModel movie) async {
    final box = await Hive.openBox<MovieHiveModel>(Constants.favCacheBox);
    await box.put(movie.movieId, movie);
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    final box = await Hive.openBox<MovieHiveModel>(Constants.favCacheBox);
    await box.delete(movieId);
  }

  @override
  Future<List<MovieHiveModel>> getFavorites() async {
    final box = await Hive.openBox<MovieHiveModel>(Constants.favCacheBox);
    return box.values.toList();
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final box = await Hive.openBox<MovieHiveModel>(Constants.favCacheBox);
    return box.containsKey(movieId);
  }
}