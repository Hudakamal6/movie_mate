part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class GetMoviesLoading extends MoviesState {}

final class GetMoviesSuccess extends MoviesState {
  final List<MovieEntity> moviesList;

  GetMoviesSuccess({
    required this.moviesList,
  });
}

final class GetMoviesError extends MoviesState {
  final String error;

  GetMoviesError({required this.error});
}

final class EmptyMoviesList extends MoviesState {}

final class GetMovieDetailsLoading extends MoviesState {}

final class GetMovieDetailsSuccess extends MoviesState {
  final MovieEntity movie;

  GetMovieDetailsSuccess({
    required this.movie,
  });
}

final class GetMovieDetailsError extends MoviesState {
  final String error;

  GetMovieDetailsError({required this.error});
}
