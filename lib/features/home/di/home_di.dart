import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/features/home/data/data_sources/local/movies_local_data_source.dart';
import 'package:movie_mate_app/features/home/domain/use_cases/serach_by_movie_name_use_case.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import '../../../../core/extensions/get_it_extension.dart';
import '../data/data_sources/local/movies_local_data_source_impl.dart';
import '../data/data_sources/remote/movies_remote_data_source.dart';
import '../data/data_sources/remote/movies_remote_data_source_impl.dart';
import '../data/repositories/movies_repo_impl.dart';
import '../domain/repositories/movies_repo.dart';
import '../domain/use_cases/get_movies_use_case.dart';

class HomeServices {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely(() => GetMoviesUseCase(repo: sl()));
    sl.registerLazySingletonSafely(() => SearchByMovieNameUseCase(repo: sl()));

    sl.registerFactorySafely(() => MoviesCubit(
        getMoviesUseCase: sl(),
        searchByMovieNameUseCase: sl(),
        ));

    sl.registerLazySingletonSafely<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(dio: sl()),
    );
    sl.registerLazySingletonSafely<MoviesLocalDataSource>(
      () => MoviesLocalDataSourceImpl(),
    );

    sl.registerLazySingletonSafely<MoviesRepo>(
      () => MoviesRepoImpl(
          remoteDataSource: sl(), localDataSource: sl(), dio: sl(), ),
    );
  }
}
