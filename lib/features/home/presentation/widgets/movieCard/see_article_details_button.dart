// import 'package:articlely/features/news/domain/entities/movie_entity.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/helpers/helpers_functions.dart';
// import '../../../../../core/theme/color_manager.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class SeeArticleDetailsButton extends StatelessWidget {
//   const SeeArticleDetailsButton({super.key, required this.publishedAt, required this.onPress});
//   final String publishedAt ;
//   final VoidCallback onPress ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text(
//               HelpersFunctions.formatDate(
//                   publishedAt),
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 11.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               width: 5.w,
//             ),
//             const Icon(Icons.alarm,
//                 size: 14, color: Colors.white),
//           ],
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor:
//             ColorManager.babyBlue.withOpacity(0.4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.r),
//             ),
//             padding: EdgeInsets.symmetric(
//                 horizontal: 7.w, vertical: 1.h),
//             elevation: 2,
//           ),
//           onPressed: onPress,
//           child: Text(
//             'See Details',
//             style: TextStyle(
//               fontSize: 11.sp,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
// }
