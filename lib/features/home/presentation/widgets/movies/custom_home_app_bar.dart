import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/helpers_functions.dart';
import '../../../../../core/theme/color_manager.dart';

class CustomArticleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomArticleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.darkSurface,
      title:  const Text(
        'Movie Mate',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: ColorManager.darkPrimaryText,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            'assets/logos/moviematelogo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // HelpersFunctions.checkCurrentSelectedCategoryIndex(
            //   context.read<CategoryCubit>().selectedIndex,
            //   context,
            //   context.read<CategoryCubit>().state.selectedCategory,
            // );
          },
          icon: const Icon(
            Icons.dark_mode,
            color: ColorManager.darkAccent,
            size: 35,
          ),
        ),
      ],
    );
  }
}
