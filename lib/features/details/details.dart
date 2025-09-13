import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import 'package:movie_mate_app/features/home/domain/use_cases/serach_by_movie_name_use_case.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import '../../../core/extensions/get_it_extension.dart';
import 'data/data_sources/movie_details_remote_data_source.dart';
import 'data/data_sources/movies_remote_data_source_impl.dart';
import 'data/repositories/movie_details_repo_impl.dart';
import 'domain/repositories/movie_details_repo.dart';
import 'domain/use_cases/get_movie_details_use_case.dart';

class DetailsServices {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<MovieDetailsRemoteDataSource>(
          () => MovieDetailsRemoteDataSourceImpl(dio: sl()),
    );

    sl.registerLazySingletonSafely<MovieDetailsRepo>(
          () => MovieDetailsRepoImpl(remoteDataSource: sl()),
    );

    sl.registerLazySingletonSafely(() => GetMovieDetailsUseCase(repo: sl()));

    sl.registerFactorySafely(
          () => MovieDetailsCubit(getMovieDetailsUseCase: sl()),
    );
  }
}
