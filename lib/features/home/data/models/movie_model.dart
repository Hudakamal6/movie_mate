import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.movieId,
    required super.movieTitle,
    required super.movieOverView,
    required super.movieImage,
    required super.movieRate,
    required super.movieReleaseDate,
    required super.movieVoteCount

  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      movieId: json['id'],
      movieTitle: json['original_title'],
      movieOverView: json['overview'],
      movieImage: json['poster_path'],
      movieReleaseDate: json['release_date'],
      movieRate: json['vote_average'],
      movieVoteCount: json['vote_count']
    );
  }
}
