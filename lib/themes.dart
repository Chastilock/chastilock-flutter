import 'package:flutter/material.dart';

class Themes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(color: Colors.blue),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(color: Colors.blue),
    scaffoldBackgroundColor: const Color(0xFF042a49),
  );
}
