import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import 'package:movie_mate_app/features/home/domain/entities/movie_entity.dart';

class FavButton extends StatefulWidget {
  final MovieEntity movie;

  const FavButton({super.key, required this.movie});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().checkIsFavMovie(widget.movie.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        bool isFav = false;

        if (state is MovieDetailsFavStatus) {
          isFav = state.isFav;
        }

        return GestureDetector(
          onTap: () {
            if (isFav) {
              context
                  .read<MovieDetailsCubit>()
                  .removeMovieFromFav(widget.movie.movieId);
            } else {
              context.read<MovieDetailsCubit>().addMovieToFav(widget.movie);
            }
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.background,
                radius: 24.r,
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                  size: 22.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Fav",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
