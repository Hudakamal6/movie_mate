
import 'movie_entity.dart';

class MoviesResponseEntity {
  final int page;
  final int totalPages;
  final List<MovieEntity> moviesList;

  const MoviesResponseEntity({
    required this.page,
    required this.totalPages,
    required this.moviesList,
  });
}
