import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.lightSurface,
      foregroundColor: ColorManager.lightPrimaryText,
      elevation: 0,
      centerTitle: true,
    ),
    colorScheme: const ColorScheme.light(
      primary: ColorManager.accent,
      secondary: ColorManager.accent,
      background: ColorManager.lightBackground,
      surface: ColorManager.lightSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: ColorManager.lightPrimaryText,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: ColorManager.lightPrimaryText,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.lightSecondaryText,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorManager.lightPrimaryText,
        fontSize: 20,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.accent,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: ColorManager.lightSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      shadowColor: Colors.black26,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorManager.accent,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.darkSurface,
      foregroundColor: ColorManager.darkPrimaryText,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.accent,
      secondary: ColorManager.accent,
      background: ColorManager.darkBackground,
      surface: ColorManager.darkSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: ColorManager.darkPrimaryText,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorManager.darkPrimaryText),
      bodyMedium: TextStyle(color: ColorManager.darkSecondaryText),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorManager.darkPrimaryText,
        fontSize: 20
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.accent,
      foregroundColor: Colors.white,
    ),
  );
}
