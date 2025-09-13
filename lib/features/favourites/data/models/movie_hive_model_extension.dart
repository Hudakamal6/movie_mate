import '../../../home/domain/entities/movie_entity.dart';
import 'movie_hive_model.dart';

extension MovieHiveMapper on MovieHiveModel {
  MovieEntity toEntity() {
    return MovieEntity(
      movieId: movieId,
      movieTitle: movieTitle,
      movieOverView: movieOverView,
      movieImage: movieImage,
      movieReleaseDate: movieReleaseDate,
      movieRate: movieRate,
      movieVoteCount: movieVoteCount,
    );
  }
}

extension MovieEntityMapper on MovieEntity {
  MovieHiveModel toHiveModel() {
    return MovieHiveModel(
      movieId: movieId,
      movieTitle: movieTitle,
      movieOverView: movieOverView,
      movieImage: movieImage!,
      movieReleaseDate: movieReleaseDate,
      movieRate: movieRate,
      movieVoteCount: movieVoteCount,
    );
  }
}
