// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/theme/color_manager.dart';
// import '../manager/news/movies_cubit.dart';
// import '../widgets/articleCard/movie_card.dart';
//
// import '../widgets/articlesScreenComponents/categories_list_widget.dart';
// import '../widgets/articlesScreenComponents/custom_error_widget.dart';
// import '../widgets/articlesScreenComponents/custom_home_app_bar.dart';
// import '../widgets/articlesScreenComponents/empty_articles.dart';
// import '../widgets/articlesScreenComponents/search_text_field.dart';
// import '../widgets/articleCard/shimmer_article_card.dart';
//
// class NewsHomeScreen extends StatelessWidget {
//   const NewsHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomArticleAppBar(),
//       body: Padding(
//         padding: EdgeInsets.only(bottom: 100.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0.h),
//               child: const SearchField(),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 20.w,
//                 vertical: 10.h,
//               ),
//               child: Text(
//                 'What Interests You? Choose a Category',
//                 style: TextStyle(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold,
//                   color: ColorManager.primaryColor,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               child: const CategoryGridSelector(),
//             ),
//             Expanded(
//               child: BlocBuilder<MoviesCubit, MoviesState>(
//                 builder: (context, state) {
//                   if (state is GetMoviesLoading) {
//                     return ListView.builder(
//                       padding: EdgeInsets.symmetric(horizontal: 10.h),
//                       itemCount: 6,
//                       itemBuilder: (context, index) =>
//                           const ShimmerArticleCard(),
//                     );
//                   } else if (state is GetMoviesSuccess) {
//                     final articles = state.moviesList;
//                     return Stack(children: [
//                       ListView.builder(
//                         padding: EdgeInsets.symmetric(horizontal: 10.h),
//                         itemCount: articles.length,
//                         itemBuilder: (context, index) {
//                           return ArticleCard(article: articles[index]);
//                         },
//                       ),
//                       Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             padding: EdgeInsets.all(10.h),
//                             decoration: BoxDecoration(
//                               color: ColorManager.babyBlue,
//                               borderRadius: BorderRadius.circular(16.r),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 8,
//                                   offset: Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Text(
//                               'Total :${state.totalResults.toString()}',
//                               style: TextStyle(
//                                   color: ColorManager.primaryColor,
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w800),
//                             ),
//                           ))
//                     ]);
//                   } else if (state is GetMoviesError) {
//                     return const Center(child: CustomErrorWidget());
//                   } else if (state is EmptyMoviesList) {
//                     return const EmptyAriclesWidget();
//                   }
//
//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
