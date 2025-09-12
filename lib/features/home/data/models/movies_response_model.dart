import '../../domain/entities/movies_response_entity.dart';
import 'movie_model.dart';

class MoviesResponseModel extends MoviesResponseEntity {
  const MoviesResponseModel({
    required super.page,
    required super.totalPages,
    required List<MovieModel> moviesList,
  }) : super(moviesList: moviesList);

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
      page: json['page'],
      totalPages: json['total_pages'],
      moviesList:
          (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }
}
