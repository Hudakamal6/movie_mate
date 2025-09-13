import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/app_routing/app_route_generator.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../pages/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final String? image;
  final String title;
  final String releaseDate;

  const MovieCard({
    super.key,
    required this.image,
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
            child:
            image == null
                ? Container(
              height: 220.h,
              color: Colors.grey.shade800,
              child:  Icon(Icons.broken_image, color: Colors.white54, size: 160.h,),
            )
                : Image.network(
              image!,
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
