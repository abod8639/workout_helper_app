import 'package:flutter/material.dart';

class AppTheme {
  // Color constants
  static const Color _primaryLight = Colors.blue;
  static const Color _primaryDark = Color(0xFF2196F3);
  static const Color _accentLight = Colors.orange;
  static const Color _accentDark = Color(0xFFFFB74D);
  static const Color _backgroundDark = Color(0xFF121212);
  static const Color _surfaceDark = Color(0xFF1E1E1E);
  static const Color _textDark = Colors.white;
  static const Color _textLightDark = Colors.white70;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _primaryLight,
    hintColor: _accentLight,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryLight,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: _primaryLight,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: _primaryDark,
    hintColor: _accentDark,
    scaffoldBackgroundColor: _backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryDark,
      secondary: _accentDark,
      surface: _surfaceDark,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: _textDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _surfaceDark,
      iconTheme: IconThemeData(color: _textDark),
      elevation: 0,
    ),
    cardColor: _surfaceDark,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _textDark,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: _textLightDark),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: _primaryDark,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _primaryDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _primaryDark.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _primaryDark, width: 2),
      ),
      labelStyle: const TextStyle(color: _textLightDark),
      hintStyle: const TextStyle(color: _textLightDark),
    ),
  );
}
