import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/widgets/custom_error_widget.dart';
import 'package:movie_mate_app/core/widgets/empty_data_widget.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../details/presentation/pages/movie_details_screen.dart';
import '../../../domain/entities/movie_entity.dart';
import '../movieCard/movie_card.dart';

class MoviesGrid extends StatefulWidget {
  const MoviesGrid({super.key});

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<MoviesCubit>();

    if (!cubit.isSearchOrCacheMode &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      cubit.getMoviesForNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      buildWhen: (_, state) =>
          state is SuccessState<List<MovieEntity>> ||
          state is ErrorState ||
          state is EmptyState,
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState<List<MovieEntity>>) {
          final movies = state.data;
          final isSearchMode = context.read<MoviesCubit>().isSearchOrCacheMode;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<MoviesCubit>().getMovies();
            },
            child: MasonryGridView.builder(
              controller: isSearchMode ? null : _scrollController,
              key: const PageStorageKey(Constants.moviesGridViewKey),
              padding: PaddingManager.all12.copyWith(bottom: 100.h),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 15.w,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    context
                        .read<MovieDetailsCubit>()
                        .getMovieDetails(movie.movieId);
                    context.read<MovieDetailsCubit>().selectedMovieId =
                        movie.movieId;
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.read<MovieDetailsCubit>(),
                          child: const MovieDetailsSheet(),
                        );
                      },
                    );
                  },
                  child: MovieCard(
                    key: ValueKey(movie.movieId),
                    image: movie.movieImage,
                    title: movie.movieTitle,
                    cachedMovieImage: movie.movieByteImage,
                    releaseDate: movie.movieReleaseDate,
                  ),
                );
              },
            ),
          );
        } else if (state is EmptyState) {
          return const EmptyDataWidget(emptyMessage: "No Results Found");
        } else if (state is ErrorState) {
          return Center(
              child: CustomErrorWidget(
                  error: state.error,
                  onRefresh: () {
                    context
                        .read<MoviesCubit>()
                        .searchMovies(context.read<MoviesCubit>().searchQuery);
                  }));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
