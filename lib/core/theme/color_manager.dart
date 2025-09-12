import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ColorManager {
  // 🌊 Existing

  // 🎬 Dark Mode
  static const Color darkBackground = Color(0xFF121212); // deep charcoal
  static const Color darkSurface = Color(0xFF1E1E1E);    // cards/dialogs
  static const Color darkPrimaryText = Color(0xFFFFFFFF);
  static const Color darkSecondaryText = Color(0xFFB3B3B3);
  static const Color darkAccent = Color(0xFF730304); // darker Netflix red
  static const Color darkSecondaryAccent = Color(0xFFBB86FC); // optional purple

  // ☀️ Light Mode
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightPrimaryText = Color(0xFF1C1C1C);
  static const Color lightSecondaryText = Color(0xFF4D4D4D);
  static const Color lightAccent = Color(0xFF8B0000); // same red accent
  static const Color lightSecondaryAccent = Color(0xFF6200EE); // deep purple
}
