import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/app_routing/app_route_generator.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../pages/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;

  const MovieCard({
    super.key,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.darkBackground,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: Image.network(
              posterPath,
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150.h,
                color: Colors.grey.shade900,
                child: const Icon(Icons.broken_image, color: Colors.white54),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Title
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorManager.darkPrimaryText,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              height: 1.3,
            ),
          ),

          SizedBox(height: 6.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: ColorManager.darkAccent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              releaseDate,
              style: TextStyle(
                color: Colors.white,
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
