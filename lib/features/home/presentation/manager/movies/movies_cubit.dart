import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_mate_app/core/error/failure.dart';
import 'package:movie_mate_app/core/extensions/failure_extension.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/get_movies_use_case.dart';
import '../../../domain/use_cases/serach_by_movie_name_use_case.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  final SearchByMovieNameUseCase searchByMovieNameUseCase;

  int _currentPage = 0;
  int _totalPages = 1;
  bool _isFetching = false;
  final List<MovieEntity> _movies = [];
  List<MovieEntity> cachedMovies = [];

  final List<MovieEntity> _searchResults = [];
  String searchQuery = '';
  Timer? _debounce;

  MoviesCubit({
    required this.getMoviesUseCase,
    required this.searchByMovieNameUseCase,
  }) : super(MoviesInitial());

  bool get isSearchOrCacheMode => searchQuery.isNotEmpty;

  Future<void> getMovies() async {
    _currentPage = 0;
    _totalPages = 1;
    _movies.clear();
    await getMoviesForNextPage();
  }

  Future<void> getMoviesForNextPage() async {
    if (_isFetching || _currentPage >= _totalPages || isSearchOrCacheMode) {
      return;
    }

    final nextPage = _currentPage + 1;
    _isFetching = true;

    if (nextPage == 1) emit(LoadingState());

    final result = await getMoviesUseCase.getMovies(nextPage);

    result.fold(
      (failure) {
        _isFetching = false;
        emit(ErrorState(failure));
      },
      (moviesData) {
        _isFetching = false;
        _totalPages = moviesData.totalPages;
        _currentPage = nextPage;
        if (moviesData.moviesList.isNotEmpty) {
          _movies.addAll(moviesData.moviesList);
          emit(SuccessState<List<MovieEntity>>(List.unmodifiable(_movies)));
        } else {
          emit(EmptyState());
        }
      },
    );
  }

  void searchMovies(String query) {
    _debounce?.cancel();
    if (query.isEmpty) {
      searchQuery = '';
      _searchResults.clear();
      emit(SuccessState<List<MovieEntity>>(List.unmodifiable(_movies)));
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      searchQuery = query;

      _searchResults.clear();
      emit(LoadingState());

      final result =
          await searchByMovieNameUseCase.searchForMovieByMovieName(query);

      result.fold(
        (failure) {
          emit(ErrorState(failure));
        },
        (movieData) {
          if (movieData.moviesList.isNotEmpty) {
            _searchResults.addAll(movieData.moviesList);
            emit(SuccessState<List<MovieEntity>>(
                List.unmodifiable(_searchResults)));
          } else {
            emit(EmptyState());
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
