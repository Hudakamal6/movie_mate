part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}

final class FavoritesLoaded extends FavoritesState {
  final List<MovieHiveModel> favorites;
  FavoritesLoaded(this.favorites);
}

final class FavoriteAdded extends FavoritesState {}

final class FavoriteRemoved extends FavoritesState {}

final class IsFavoriteChecked extends FavoritesState {
  final bool isFavorite;
  IsFavoriteChecked(this.isFavorite);
}
