import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_manager.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextContainer extends StatelessWidget {
  const AnimatedTextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100.h, bottom: 30.h),
      width: 300.w,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: ColorManager.darkSurface,
        ),
        child: Align(
          alignment: Alignment.center,
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Articlely',
                textStyle: TextStyle(
                    fontSize: 40.sp,
                    color: ColorManager.darkSurface),
                speed: const Duration(milliseconds: 300),
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
      ),
    );
  }
}
