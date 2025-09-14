import 'package:flutter/material.dart';
import 'app_theme.dart';

enum ThemeType { light, dark }

class ThemeFactory {
  static ThemeData createTheme(ThemeType type) {
    switch (type) {
      case ThemeType.dark:
        return AppTheme.darkTheme;
      case ThemeType.light:
      default:
        return AppTheme.lightTheme;
    }
  }
}
