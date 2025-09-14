import 'package:hive/hive.dart';

import '../../../../../core/models/movie_hive_model.dart';

abstract class MoviesLocalDataSource {
  Future<void> cacheMovies(List<MovieHiveModel> movies);
  Future<List<MovieHiveModel>> getCachedMovies();
}

