import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/core/widgets/empty_data_widget.dart';
import 'package:movie_mate_app/features/favourites/presentation/manager/favorites_cubit.dart';

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
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
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

          if (state is FavoritesLoaded) {
            final movies = state.favorites;
            if (movies.isEmpty) {
              return const Center(
                  child: EmptyDataWidget(emptyMessage: "No Favorites Yet 😔"));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return FavMovieCardWidget(movie: movie);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
