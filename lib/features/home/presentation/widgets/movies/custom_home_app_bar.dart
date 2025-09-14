import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mate_app/core/theme/padding_manager.dart';
import 'package:movie_mate_app/core/theme/radius_manager.dart';
import '../../../../../core/theme/theme_cubit.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        'Movie Mate',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      leading: Padding(
        padding: PaddingManager.all4,
        child: ClipRRect(
          borderRadius: RadiusManager.radius16,
          child: Image.asset(
            'assets/logos/moviematelogo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, themeData) {
            final isDark = themeData.brightness == Brightness.dark;
            return IconButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: themeData.colorScheme.primary,
                size: 30,
              ),
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            );
          },
        ),
      ],
    );
  }
}
