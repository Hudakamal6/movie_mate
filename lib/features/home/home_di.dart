import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/features/home/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import '../../../core/extensions/get_it_extension.dart';
import 'data/data_sources/movies_remote_data_source.dart';
import 'data/data_sources/movies_remote_data_source_impl.dart';
import 'data/repositories/movies_repo_impl.dart';
import 'domain/repositories/movies_repo.dart';
import 'domain/use_cases/get_movies_use_case.dart';

class HomeServices {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely(() => GetMoviesUseCase(repo: sl()));
    sl.registerLazySingletonSafely(() => GetMovieDetailsUseCase(repo: sl()));

    sl.registerFactorySafely(() =>
        MoviesCubit(getMoviesUseCase: sl(), getMovieDetailsUseCase: sl()));

    sl.registerLazySingletonSafely<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(dio: sl()),
    );

    sl.registerLazySingletonSafely<MoviesRepo>(
      () => MoviesRepoImpl(remoteDataSource: sl()),
    );
  }
}
