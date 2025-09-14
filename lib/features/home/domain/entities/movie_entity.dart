import 'dart:typed_data';

class MovieEntity {
  final int movieId;
  final String movieTitle;
  final String movieOverView;
  final String? movieImage;
  final Uint8List? movieByteImage;
  final String movieReleaseDate;
  final double movieRate;
  final int movieVoteCount;

  const MovieEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.movieOverView,
      this.movieImage,
      this.movieByteImage,
      required this.movieReleaseDate,
      required this.movieRate,
      required this.movieVoteCount});
}
