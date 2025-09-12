import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_routing/routes_names.dart';
import '../../../../core/theme/color_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _textRevealAnimation;
  late Animation<double> _logoOpacityAnimation;

  String displayedText = "";
  String fullText = "Movie Mate";
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _textRevealAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.6, curve: Curves.easeIn)),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.6, 1.0, curve: Curves.easeIn)),
    );

    _controller.addListener(() {
      final textProgress = _textRevealAnimation.value;
      final lettersToShow = (fullText.length * textProgress).ceil();

      setState(() {
        displayedText = fullText.substring(0, lettersToShow);
        showLogo = textProgress >= 1.0;
      });

      if (_controller.isCompleted) {
        Navigator.pushReplacementNamed(context, RoutesNames.home);
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkBackground, // 🌙 dark mode bg
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Text(
                      displayedText,
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.darkAccent, // 🔴 deep red
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                if (showLogo)
                  Opacity(
                    opacity: _logoOpacityAnimation.value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ClipOval(
                        child: Container(
                          color: ColorManager.darkSurface,
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "MM", // placeholder logo initials
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkPrimaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
