import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/widgets/movie_cached_image_widget.dart';

import '../movies/movie_grid_view_image_widget.dart';

class MovieCard extends StatelessWidget {
  final String? image;
  final Uint8List? cachedMovieImage;
  final String title;
  final String releaseDate;

  const MovieCard({
    super.key,
    required this.image,
    required this.title,
    required this.cachedMovieImage,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child:image == null
                ? MovieCachedImageWidget(cachedMovieImage: cachedMovieImage,)

                : MovieGridViewImageWidget(image: image,) ,
          ),

          SizedBox(height: 8.h),

          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              height: 1.3,
            ),
          ),

          SizedBox(height: 6.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              releaseDate,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
