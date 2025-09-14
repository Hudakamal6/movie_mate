import 'package:dio/dio.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/movie_model.dart';
import 'movie_details_remote_data_source.dart';

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final Dio dio;

  MovieDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    try {
      final response =
          await dio.get(Constants.getMovieDetailsEndpoint + movieId.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MovieModel.fromJson(response.data);
      } else {
        final message =
            response.data['statues_message'] ?? 'Unknown error occurred';
        throw ServerFailure(message);
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
