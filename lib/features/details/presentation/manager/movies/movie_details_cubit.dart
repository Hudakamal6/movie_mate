import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_mate_app/features/details/domain/use_cases/get_movie_details_use_case.dart';

import '../../../../home/domain/entities/movie_entity.dart';

part 'movies_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;



  MovieDetailsCubit({
    required this.getMovieDetailsUseCase,
  }) : super(MovieDetailsInitial());




  Future<void> getMovieDetails(int movieId) async {
    emit(GetMovieDetailsLoading());

    final result = await getMovieDetailsUseCase.getMovieDetails(movieId);

    result.fold(
      (failure) => emit(GetMovieDetailsError(failure.message)),
      (movie) => emit(GetMovieDetailsSuccess(movie: movie)),
    );
  }


}
