

import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../domain/entities/movies_response_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponseEntity> getMovies(int pageNum);
  Future<MovieEntity> getMovieDetails(int movieId);
  Future<MoviesResponseEntity> searchForMovieByMovieName(String movieName);

}
