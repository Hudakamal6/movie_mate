import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../widgets/movie_details_data.dart';

class MovieDetailsSheet extends StatelessWidget {
  const MovieDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (_, current) =>
          current is MovieDetailsLoading<MovieEntity> ||
          current is MovieDetailsSuccess<MovieEntity> ||
          current is MovieDetailsError,
      builder: (context, state) {
        if (state is MovieDetailsLoading<MovieEntity>) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MovieDetailsError) {
          return Center(
            child: Text(
              state.message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          );
        }

        if (state is MovieDetailsSuccess<MovieEntity>) {
          final movie = state.data;

          return MovieDetailsData(movie: movie);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
