import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/models/movie_hive_model.dart';
import '../../domain/use_cases/add_movie_to_fav_use_case.dart';
import '../../domain/use_cases/get_fav_use_case.dart';
import '../../domain/use_cases/is_fav_use_case.dart';
import '../../domain/use_cases/remove_from_fav_use_case.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  FavoritesCubit({
    required this.addToFavoritesUseCase,
    required this.removeFromFavoritesUseCase,
    required this.getFavoritesUseCase,
    required this.isFavoriteUseCase,
  }) : super(FavoritesInitial());

  Future<void> addToFavorites(MovieEntity movie) async {
    emit(FavoritesLoading());
    final result = await addToFavoritesUseCase(movie);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (_) => emit(FavoriteAdded()),
    );
  }

  Future<void> removeFromFavorites(int movieId) async {
    emit(FavoritesLoading());
    final result = await removeFromFavoritesUseCase(movieId);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (_) => emit(FavoriteRemoved()),
    );
  }

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    final result = await getFavoritesUseCase();
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (movies) => emit(FavoritesLoaded(movies)),
    );
  }

  Future<void> checkIfFavorite(int movieId) async {
    emit(FavoritesLoading());
    final result = await isFavoriteUseCase(movieId);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (isFav) => emit(IsFavoriteChecked(isFav)),
    );
  }
}
