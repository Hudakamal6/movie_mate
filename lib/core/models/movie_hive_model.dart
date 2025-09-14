import 'dart:typed_data'; // Add this
import 'package:hive/hive.dart';

part 'movie_hive_model.g.dart';

@HiveType(typeId: 0)
class MovieHiveModel extends HiveObject {
  @HiveField(0)
  int movieId;

  @HiveField(1)
  String movieTitle;

  @HiveField(2)
  String movieOverView;

  @HiveField(3)
  Uint8List? movieImage; // ✅ store as binary data

  @HiveField(4)
  String movieReleaseDate;

  @HiveField(5)
  double movieRate;

  @HiveField(6)
  int movieVoteCount;

  MovieHiveModel({
    required this.movieId,
    required this.movieTitle,
    required this.movieOverView,
     this.movieImage,
    required this.movieReleaseDate,
    required this.movieRate,
    required this.movieVoteCount,
  });
}
