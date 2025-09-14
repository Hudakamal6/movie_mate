import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/widgets/empty_data_widget.dart';
import 'package:movie_mate_app/features/favourites/presentation/manager/favorites_cubit.dart';

import '../../../details/presentation/manager/movies/movie_details_cubit.dart';
import '../../../details/presentation/pages/movie_details_screen.dart';
import '../widgets/fav_movie_card_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Favourites ❤️",
          style: theme.textTheme.titleLarge,
        ),
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
            onPressed: () {
              context.read<FavoritesCubit>().getFavorites();
            },
            icon: const Icon(Icons.refresh),
            color: theme.colorScheme.primary,
            tooltip: 'Refresh'),
      ),
      body: BlocConsumer<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavoritesError) {
            return Center(
              child: Text(
                state.message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            );
          }
          if (state is EmptyFavState) {
            return const Center(
                child: EmptyDataWidget(emptyMessage: "No Favorites Yet 😔"));
          }
          if (state is FavoritesLoaded) {
            final movies = state.favorites;

            return ListView.builder(
              padding: PaddingManager.all12,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return GestureDetector(
                  child: FavMovieCardWidget(movie: movie),
                  onTap: () {
                    context
                        .read<MovieDetailsCubit>()
                        .getMovieDetails(movie.movieId);
                    context.read<MovieDetailsCubit>().selectedMovieId = movie.movieId ;

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
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
        buildWhen: (_, current) {
          return current is FavoritesError ||
              current is FavoritesLoaded ||
              current is FavoritesLoaded ||
              current is EmptyFavState;
        },
        listener: (context, state) {
          if (state is FavoriteRemoved) {
            context.read<FavoritesCubit>().getFavorites();
          }
        },
        listenWhen: (_, current) {
          return current is FavoriteRemoved;
        },
      ),
    );
  }
}
