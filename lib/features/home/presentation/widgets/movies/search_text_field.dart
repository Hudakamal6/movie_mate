import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/color_manager.dart';
import '../../manager/movies/movies_cubit.dart';

class SearchMovieField extends StatefulWidget {
  const SearchMovieField({super.key});

  @override
  State<SearchMovieField> createState() => _SearchMovieFieldState();
}

class _SearchMovieFieldState extends State<SearchMovieField> {
  final TextEditingController _controller = TextEditingController();

  void _clearSearch() {
    _controller.clear();
    FocusScope.of(context).unfocus();
    context.read<MoviesCubit>().searchMovies(""); // reset search
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isTyping = _controller.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: ColorManager.darkBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: ColorManager.darkBackground.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          cursorColor: ColorManager.darkAccent,
          style: TextStyle(
            color: ColorManager.darkPrimaryText,
            fontSize: 13.sp,
          ),
          decoration: InputDecoration(
            hintText: 'Search by movie name...',
            hintStyle: const TextStyle(color: ColorManager.darkSecondaryText),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: ColorManager.darkAccent),
            suffixIcon: isTyping
                ? GestureDetector(
              onTap: _clearSearch,
              child: const Icon(Icons.close,
                  color: ColorManager.darkAccent),
            )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 13.h),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              _clearSearch();
            } else if (value.length > 2) {
              context.read<MoviesCubit>().searchMovies(value);
            }
            setState(() {});
          },
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
