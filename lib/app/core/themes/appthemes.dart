import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Color(0xFF159778);
  static final ThemeData light =
      ThemeData(brightness: Brightness.light, colorSchemeSeed: primaryColor);

  static final ThemeData dark = ThemeData(
      colorSchemeSeed: primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF030308));
}
