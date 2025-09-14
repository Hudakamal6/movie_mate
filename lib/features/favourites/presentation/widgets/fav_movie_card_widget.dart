import 'package:flutter/material.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/theme/radius_manager.dart';

import '../../../../core/models/movie_hive_model.dart';
import '../../../../core/widgets/movie_cached_image_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/favorites_cubit.dart';

class FavMovieCardWidget extends StatelessWidget {
  const FavMovieCardWidget({
    super.key,
    required this.movie,
  });

  final MovieHiveModel movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin:  EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius:RadiusManager.radius16,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: RadiusManager.radius16,
              child: MovieCachedImageWidget(cachedMovieImage: movie.movieImage,)
          ),

          // Details
          Expanded(
            child: Padding(
              padding: PaddingManager.all12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.movieTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                   SizedBox(height: 6.h),
                  Text(
                    "Released: ${movie.movieReleaseDate}",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onBackground
                          .withOpacity(0.7),
                    ),
                  ),
                   SizedBox(height: 8.h),
                  Row(
                    children: [
                       Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18.sp,
                      ),
                       SizedBox(width: 4.w),
                      Text(
                        "${movie.movieRate.toStringAsFixed(1)} / 10",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: () {
                          context
                              .read<FavoritesCubit>()
                              .removeFromFavorites(movie.movieId);



                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
