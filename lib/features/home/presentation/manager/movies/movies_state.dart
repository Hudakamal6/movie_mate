part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class LoadingState extends MoviesState {}

final class SuccessState<T> extends MoviesState {
  final T data;

  SuccessState(this.data);
}

final class MoviesCachedSuccess extends MoviesState {
  MoviesCachedSuccess();
}

final class ErrorState extends MoviesState {
  final String error;

  ErrorState(this.error);
}

final class EmptyState extends MoviesState {}
