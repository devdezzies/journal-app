import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
      fontFamily: 'PlusJakartaSans',
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.black,
          foregroundColor: Colors.white
        )
      ),
      colorScheme: const ColorScheme.light(
          surface: Colors.black,
          primary: Colors.black,
          secondary: Colors.grey));

  static ThemeData darkMode = ThemeData(
      fontFamily: 'PlusJakartaSans',
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )
      ),
      colorScheme: const ColorScheme.dark(
          surface: Colors.white,
          primary: Colors.white,
          secondary: Colors.grey));
}
