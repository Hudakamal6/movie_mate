import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../pages/movie_details_screen.dart';
import '../movieCard/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        print("enterrr build");
        print(state);
        if (state is GetMoviesSuccess) {
          return MasonryGridView.builder(
            key: const PageStorageKey(Constants.moviesGridViewKey),
            // 👈 remembers scroll position
            padding: EdgeInsets.all(20.h).copyWith(bottom: 100.h),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of columns
            ),
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 15.w,
            itemCount: state.moviesList.length,
            itemBuilder: (context, index) {
              final movie = state.moviesList[index];

              return GestureDetector(
                onTap: () {
                  context.read<MoviesCubit>().getMovieDetails(movie.movieId);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<MoviesCubit>(),
                        // 👈 reuse existing cubit
                        child: const MovieDetailsSheet(),
                      );
                    },
                  );
                },
                child: MovieCard(
                  key: ValueKey(movie.movieId),
                  posterPath: Constants.imageBaseUrl + movie.movieImage,
                  title: movie.movieTitle,
                  releaseDate: movie.movieReleaseDate,
                ),
              );
            },
          );
          ;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      buildWhen: (_, state) {
        return state is GetMoviesSuccess ||
            state is GetMoviesError ||
            state is GetMoviesLoading;
      },
    );
  }
}
