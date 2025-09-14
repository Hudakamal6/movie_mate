import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_mate_app/core/error/failure.dart';
import 'package:movie_mate_app/features/details/domain/use_cases/check_is_movie_on_fav_use_case.dart';
import 'package:movie_mate_app/features/details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_mate_app/features/details/domain/use_cases/remove_movie_details_from_fav_use_case.dart';

import '../../../../home/domain/entities/movie_entity.dart';
import '../../../domain/use_cases/add_movie_details_to_fav_use_case.dart';

part 'movies_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final AddMovieDetailsToFavUseCase addMovieDetailsToFavUseCase;
  final RemoveMovieDetailsFromFav removeMovieDetailsFromFavUseCase;
  final CheckIsMovieOnFavUseCase checkIsMovieOnFavUseCase;

  MovieDetailsCubit(
      {required this.getMovieDetailsUseCase,
      required this.addMovieDetailsToFavUseCase,
      required this.checkIsMovieOnFavUseCase,
      required this.removeMovieDetailsFromFavUseCase})
      : super(MovieDetailsInitial());

  late int selectedMovieId ;
  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading<MovieEntity>());

    final result = await getMovieDetailsUseCase.getMovieDetails(movieId);

    result.fold(
      (failure) => emit(MovieDetailsError(failure)),
      (movie) => emit(MovieDetailsSuccess<MovieEntity>(movie)),
    );
  }

  Future<void> addMovieToFav(MovieEntity movie) async {
    final result = await addMovieDetailsToFavUseCase.call(movie);
    result.fold(
      (failure) {
        emit(MovieDetailsError(const CacheFailure("Error Add Movie To Fav")));
      },
      (_) {
        emit(MovieDetailsSuccess<bool>(true));
        emit(MovieDetailsFavStatus(true));
      },
    );
  }

  Future<void> removeMovieFromFav(int movieId) async {
    final result = await removeMovieDetailsFromFavUseCase.call(movieId);
    result.fold(
      (failure) => emit(
          MovieDetailsError(const CacheFailure("Error On Remove From Cache"))),
      (_) {
        emit(MovieDetailsSuccess<bool>(true));
        emit(MovieDetailsFavStatus(false));
      },
    );
  }

  Future<void> checkIsFavMovie(int movieId) async {
    final result = await checkIsMovieOnFavUseCase.call(movieId);
    result.fold(
      (failure) =>
          emit(MovieDetailsError(const CacheFailure("Error Chcek Is Fav "))),
      (isFav) => emit(MovieDetailsFavStatus(isFav)),
    );
  }
}
