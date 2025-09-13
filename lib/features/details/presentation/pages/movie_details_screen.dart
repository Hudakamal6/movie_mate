import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/constants/constants.dart';
import 'package:movie_mate_app/features/details/presentation/manager/movies/movie_details_cubit.dart';
import 'package:movie_mate_app/features/home/presentation/manager/movies/movies_cubit.dart';
import 'package:movie_mate_app/features/home/presentation/widgets/movieDetails/fav_button_widget.dart';
import '../../../../../core/theme/color_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/domain/entities/movie_entity.dart';


class MovieDetailsSheet extends StatelessWidget {
  const MovieDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is GetMovieDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetMovieDetailsError) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is GetMovieDetailsSuccess) {
          final movie = state.movie;

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.92,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorManager.darkBackground,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
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
                            color: ColorManager.darkAccent,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                      ),

                      // Poster header
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.r),
                        ),
                        child:
                        movie.movieImage == null
                            ? Container(
                          height: 220.h,
                          color: Colors.grey.shade800,
                          child: const Icon(Icons.broken_image, color: Colors.white54),
                        )
                            : Image.network(
                          Constants.imageBaseUrl + movie.movieImage!,
                          width: double.infinity,
                          height: 220.h,
                          fit: BoxFit.contain,
                          errorBuilder: (context, _, __) => Container(
                            height: 220.h,
                            color: Colors.grey.shade800,
                            child: const Icon(Icons.broken_image, color: Colors.white54),
                          ),
                        )
                        ,
                      ),

                      // Info Card
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorManager.darkSurface,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title & Release Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    movie.movieTitle,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.darkPrimaryText,
                                      height: 1.2,
                                    ),

                                    maxLines: 2,
                                    overflow: TextOverflow
                                        .ellipsis, // prevents overflow
                                  ),
                                ),
                                FavButton(
                                  icon: Icons.favorite_border,
                                  label: "Like",
                                  onTap: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),

                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: ColorManager.darkAccent,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                "Released on ${movie.movieReleaseDate}",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: ColorManager.darkPrimaryText,
                                ),
                              ),
                            ),

                            SizedBox(height: 12.h),

                            // Rating row
                            Row(
                              children: [
                                Icon(Icons.star_rounded,
                                    color: Colors.amber, size: 22.sp),
                                SizedBox(width: 6.w),
                                Text(
                                  "${movie.movieRate.toStringAsFixed(1)} / 10",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.darkPrimaryText,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${movie.movieVoteCount} votes",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.darkSecondaryText,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20.h),

                            // Overview
                            Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.darkPrimaryText,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              movie.movieOverView,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.darkSecondaryText,
                                height: 1.5,
                              ),
                            ),

                            SizedBox(height: 24.h),
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

        return const SizedBox.shrink();
      },
    );
  }
}
