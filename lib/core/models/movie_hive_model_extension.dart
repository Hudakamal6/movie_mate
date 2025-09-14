import 'dart:typed_data';
import '../../features/home/domain/entities/movie_entity.dart';
import 'movie_hive_model.dart';

extension MovieHiveMapper on MovieHiveModel {
  MovieEntity toEntity() {
    return MovieEntity(
      movieId: movieId,
      movieTitle: movieTitle,
      movieOverView: movieOverView,
      movieImage: null,
      movieReleaseDate: movieReleaseDate,
      movieRate: movieRate,
      movieVoteCount: movieVoteCount,
    );
  }
}

extension MovieEntityMapper on MovieEntity {
  MovieHiveModel toHiveModel(Uint8List? imageBytes) {
    return MovieHiveModel(
      movieId: movieId,
      movieTitle: movieTitle,
      movieOverView: movieOverView,
      movieImage: imageBytes, // ✅ now correct type
      movieReleaseDate: movieReleaseDate,
      movieRate: movieRate,
      movieVoteCount: movieVoteCount,
    );
  }
}
