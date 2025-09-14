import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_factory.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeFactory.createTheme(ThemeType.dark));

  void toggleTheme() {
    final isDark = state.brightness == Brightness.dark;
    emit(
      ThemeFactory.createTheme(isDark ? ThemeType.light : ThemeType.dark),
    );
  }
}
