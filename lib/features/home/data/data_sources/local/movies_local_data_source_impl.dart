import 'package:hive/hive.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/core/models/movie_hive_model.dart';
import 'package:movie_mate_app/features/home/data/data_sources/local/movies_local_data_source.dart';


class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {

  @override
  Future<void> cacheMovies(List<MovieHiveModel> movies) async {
    final box = await Hive.openBox<MovieHiveModel>(Constants.moviesCacheBox);

    final Map<int, MovieHiveModel> moviesMap = {
      for (var movie in movies) movie.movieId: movie
    };

    await box.putAll(moviesMap);
  }


  @override
  Future<List<MovieHiveModel>> getCachedMovies()  async{
    final box = await Hive.openBox<MovieHiveModel>(Constants.moviesCacheBox);
    return box.values.toList();
  }


}