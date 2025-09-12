import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_mate_app/features/home/domain/use_cases/get_movie_details_use_case.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/get_movies_use_case.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MoviesCubit(
      {required this.getMoviesUseCase, required this.getMovieDetailsUseCase})
      : super(MoviesInitial());

  Future<void> getMovies() async {
    emit(GetMoviesLoading());

    final result = await getMoviesUseCase.getMovies();

    result.fold(
      (failure) {
        print('errorr');
        print(failure.message);
        emit(GetMoviesError(error: failure.message));
      },
      (movies) {
        if (movies.moviesList.isNotEmpty) {
          emit(GetMoviesSuccess(
            moviesList: movies.moviesList,
          ));
        } else {
          emit(EmptyMoviesList());
        }
      },
    );
  }

  Future<void> getMovieDetails(int movieId) async {
    emit(GetMovieDetailsLoading());

    final result = await getMovieDetailsUseCase.getMovies(movieId);

    result.fold(
      (failure) {
        print('errorr');
        print(failure.message);
        emit(GetMovieDetailsError(error: failure.message));
      },
      (movieDetails) {
        emit(GetMovieDetailsSuccess(
          movie: movieDetails,
        ));
      },
    );
  }
}
