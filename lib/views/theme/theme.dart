import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFC107);
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF1E1E28);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1); // we use it on our animation
const maxWidth = 1440.0; // max width of our web

class ThemesApp {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    iconTheme: const IconThemeData(color: Colors.red),
    primaryColor: primaryColor,
    canvasColor: bgColor,
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: bodyTextColor),
        bodyText2: TextStyle(color: bodyTextColor)),
    scaffoldBackgroundColor: bgColor,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: bgColor,
        elevation: 0,
        toolbarTextStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
    brightness: Brightness.dark,
  );
}
