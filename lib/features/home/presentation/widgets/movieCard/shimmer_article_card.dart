// import 'package:articlely/core/theme/color_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
//
// class ShimmerArticleCard extends StatelessWidget {
//   const ShimmerArticleCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 170.h,
//       margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         color: ColorManager.babyBlue.withOpacity(0.35),
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Shimmer.fromColors(
//         baseColor: ColorManager.primaryColor.withOpacity(0.2),
//         highlightColor: ColorManager.primaryColor.withOpacity(0.6),
//         child: Stack(
//           children: [
//             Positioned(
//               left: 14.w,
//               right: 14.w,
//               bottom: 16.h,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 12.h,
//                     color: Colors.grey[400],
//                   ),
//                   SizedBox(height: 6.h),
//                   Container(
//                     width: double.infinity,
//                     height: 10.h,
//                     color: Colors.grey[400],
//                   ),
//                   SizedBox(height: 10.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 60.w,
//                         height: 10.h,
//                         color: Colors.grey[400],
//                       ),
//                       Container(
//                         width: 70.w,
//                         height: 25.h,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[400],
//                           borderRadius: BorderRadius.circular(16.r),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
