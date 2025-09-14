import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/theme/radius_manager.dart';
import 'package:movie_mate_app/core/widgets/custom_error_widget.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../widgets/movie_details_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

        if (state is MovieDetailsSuccess<MovieEntity>) {
          final movie = state.data;

          return MovieDetailsData(movie: movie);
        }
        if (state is MovieDetailsError) {
          return Container(
            width: double.infinity,
            height: 300.h,
            padding: PaddingManager.all12,
            margin:  EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius:RadiusManager.radius8,
            ),
            child: Center(
                child: CustomErrorWidget(
                    error: state.failure,
                    onRefresh: () {
                      context.read<MovieDetailsCubit>().getMovieDetails(
                          context.read<MovieDetailsCubit>().selectedMovieId);
                    })),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
