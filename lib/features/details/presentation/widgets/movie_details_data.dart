import 'package:flutter/material.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/theme/radius_manager.dart';

import '../../../home/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/widgets/movies/movie_grid_view_image_widget.dart';
import 'fav_button_widget.dart';

class MovieDetailsData extends StatelessWidget {
  const MovieDetailsData({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.92,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: RadiusManager.radius24
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60.w,
                    height: 5.h,
                    margin: EdgeInsets.only(top: 8.h, bottom: 12.h),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),

                ClipRRect(
                    borderRadius: RadiusManager.radius24,
                    child: MovieGridViewImageWidget(image: movie.movieImage)),

                Container(
                  padding: PaddingManager.all16,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: RadiusManager.radius24
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              movie.movieTitle,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          FavButton(movie: movie),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: PaddingManager.all4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: RadiusManager.radius24,
                        ),
                        child: Text(
                          "Released on ${movie.movieReleaseDate}",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 13.sp,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 22.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "${movie.movieRate.toStringAsFixed(1)} / 10",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${movie.movieVoteCount} votes",
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Overview",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        movie.movieOverView,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
