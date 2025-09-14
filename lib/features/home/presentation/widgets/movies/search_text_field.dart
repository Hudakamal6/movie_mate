import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    context.read<MoviesCubit>().searchMovies("");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isTyping = _controller.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .shadow
                  .withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          cursorColor: Theme.of(context).colorScheme.primary,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 13.sp,
          ),
          decoration: InputDecoration(
            hintText: 'Search by movie name...',
            hintStyle: TextStyle(
              color: Theme.of(context).hintColor,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            suffixIcon: isTyping
                ? GestureDetector(
              onTap: _clearSearch,
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.primary,
              ),
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
