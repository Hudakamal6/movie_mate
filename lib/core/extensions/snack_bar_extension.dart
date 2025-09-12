import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_manager.dart';

extension CustomSnackBarExtension on BuildContext {
  void showCustomSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        backgroundColor: ColorManager.darkSurface,
      ),
    );
  }
}
