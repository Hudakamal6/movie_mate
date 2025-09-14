import 'package:flutter/material.dart';
import 'package:movie_mate_app/core/error/failure.dart';
import 'package:movie_mate_app/core/extensions/snack_bar_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mate_app/core/theme/radius_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final Failure error;

  final VoidCallback onRefresh;

  const CustomErrorWidget(
      {super.key, required this.error, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: RadiusManager.radius50,
            child: Image.asset(
              "assets/placeholders/error.jpg",
              width: 200.w,
              height: 200.h,
            )),
        SizedBox(
          height: 10.h,
        ),
        Text(error.message),
        error is NetworkFailure
            ? ElevatedButton(onPressed: onRefresh, child: const Text("Refresh"))
            : const SizedBox.shrink()
      ],
    );
  }
}
