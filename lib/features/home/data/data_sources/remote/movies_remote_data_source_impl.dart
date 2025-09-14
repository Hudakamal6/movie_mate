import 'package:dio/dio.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/movies_response_entity.dart';
import '../../models/movie_model.dart';
import '../../models/movies_response_model.dart';
import 'movies_remote_data_source.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl({required this.dio});

  @override
  Future<MoviesResponseEntity> getMovies(int pageNum) async {
    try {
      final response =
          await dio.get(Constants.getMoviesListEndpoint + pageNum.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MoviesResponseModel.fromJson(response.data);
      } else {
        final message =
            response.data['status_message'] ?? 'Unknown error occurred';
        throw ServerFailure(message);
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    }

  }

  @override
  Future<MoviesResponseEntity> searchForMovieByMovieName(
      String movieName) async {
    try {
      final response =
          await dio.get(Constants.getMovieByNameEndpoint + movieName);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MoviesResponseModel.fromJson(response.data);
      } else {
        final message =
            response.data['status_message'] ?? 'Unknown error occurred';
        throw ServerFailure(message);
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
