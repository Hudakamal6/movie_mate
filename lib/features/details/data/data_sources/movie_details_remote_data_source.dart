

import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';


abstract class MovieDetailsRemoteDataSource {
  Future<MovieEntity> getMovieDetails(int movieId);

}
