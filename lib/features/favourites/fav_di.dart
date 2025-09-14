import 'package:get_it/get_it.dart';
import 'package:movie_mate_app/features/favourites/presentation/manager/favorites_cubit.dart';

import '../../../core/extensions/get_it_extension.dart';
import 'data/data_sources/fav_local_data_source.dart';
import 'data/data_sources/fav_local_data_source_impl.dart';
import 'data/repositories/fav_repo_impl.dart';
import 'domain/repositories/fav_repo.dart';
import 'domain/use_cases/add_movie_to_fav_use_case.dart';
import 'domain/use_cases/get_fav_use_case.dart';
import 'domain/use_cases/is_fav_use_case.dart';
import 'domain/use_cases/remove_from_fav_use_case.dart';

class FavServices {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<FavoritesLocalDataSource>(
          () => FavoritesLocalDataSourceImpl(),
    );

    sl.registerLazySingletonSafely<FavoritesRepo>(
          () => FavoritesRepoImpl(localDataSource: sl(), dio: sl()),
    );

    sl.registerLazySingletonSafely(() => AddToFavoritesUseCase(sl()));
    sl.registerLazySingletonSafely(() => RemoveFromFavoritesUseCase(sl()));
    sl.registerLazySingletonSafely(() => GetFavoritesUseCase(sl()));
    sl.registerLazySingletonSafely(() => IsFavoriteUseCase(sl()));

    sl.registerFactorySafely(
          () => FavoritesCubit(
        addToFavoritesUseCase: sl(),
        removeFromFavoritesUseCase: sl(),
        getFavoritesUseCase: sl(),
        isFavoriteUseCase: sl(),
      ),
    );
  }
}
