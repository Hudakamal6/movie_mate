part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class GetMovieDetailsLoading extends MovieDetailsState {}

final class GetMovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;
  GetMovieDetailsSuccess({required this.movie});
}

final class GetMovieDetailsError extends MovieDetailsState {
  final String error;
  GetMovieDetailsError(this.error);
}

