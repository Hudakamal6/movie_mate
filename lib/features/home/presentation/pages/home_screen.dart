import 'package:flutter/material.dart';
import 'package:movie_mate_app/core/theme/color_manager.dart';

import '../widgets/movies/custom_home_app_bar.dart';
import '../widgets/movies/movies_grid_widget.dart';
import '../widgets/movies/search_movie_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomArticleAppBar(),
      backgroundColor: ColorManager.darkSurface,
      body: Column(
        children: [
          SearchMovieField(),
          Expanded(child: MoviesGrid()),
        ],
      ),
    );
  }
}
