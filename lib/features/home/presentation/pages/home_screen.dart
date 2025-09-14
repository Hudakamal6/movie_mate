import 'package:flutter/material.dart';

import '../widgets/movies/custom_home_app_bar.dart';
import '../widgets/movies/movies_grid_widget.dart';
import '../widgets/movies/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHomeAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Column(
        children: [
          SearchMovieField(),
          Expanded(child: MoviesGrid()),
        ],
      ),
    );
  }
}
