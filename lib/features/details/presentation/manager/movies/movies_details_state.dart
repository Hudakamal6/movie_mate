part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading<T> extends MovieDetailsState {}

final class MovieDetailsSuccess<T> extends MovieDetailsState {
  final T data;

  MovieDetailsSuccess(this.data);
}

final class MovieDetailsError extends MovieDetailsState {
  final Failure failure;

  MovieDetailsError(this.failure);
}

final class MovieDetailsFavStatus extends MovieDetailsState {
  final bool isFav;

  MovieDetailsFavStatus(this.isFav);
}
