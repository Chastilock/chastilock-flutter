import 'package:flutter/material.dart';

class Themes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(color: Colors.blue),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(color: Colors.blue),
      scaffoldBackgroundColor: const Color(0xFF042a49),
      primaryColor: Colors.blue);
}
