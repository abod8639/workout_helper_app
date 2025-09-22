import 'package:flutter/material.dart';

class AppTheme {
  // Light theme colors - Soft and Calm
  static const Color _primaryLight = Color(0xFF64B5F6);  // Softer blue
  static const Color _secondaryLight = Color(0xFFFFB74D); // Soft orange
  static const Color _backgroundLight = Color(0xFFF8F9FA); // Very light gray-blue
  static const Color _surfaceLight = Color(0xFFFFFFFF);   // Pure white
  static const Color _errorLight = Color(0xFFEF9A9A);     // Soft red
  static const Color _textLight = Color(0xFF37474F);      // Soft dark blue-grey
  static const Color _textLightSecondary = Color(0xFF78909C); // Lighter blue-grey
  static const Color _dividerLight = Color(0xFFECEFF1);   // Very soft blue-grey

  // Dark theme colors
  static const Color _primaryDark = Color(0xFF2196F3);
  static const Color _accentDark = Color(0xFFFFB74D);
  static const Color _backgroundDark = Color(0xFF121212);
  static const Color _surfaceDark = Color(0xFF1E1E1E);
  static const Color _textDark = Colors.white;
  static const Color _textLightDark = Colors.white70;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: _primaryLight,
    hintColor: _secondaryLight,
    scaffoldBackgroundColor: _backgroundLight,
    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      secondary: _secondaryLight,
      surface: _surfaceLight,
      error: _errorLight,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: _textLight,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _surfaceLight,
      foregroundColor: _textLight,
      iconTheme: IconThemeData(color: _textLight),
      elevation: 0.5,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: _surfaceLight,
      elevation: 1,
      shadowColor: _primaryLight.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    textTheme: TextTheme(
      titleLarge:  TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _textLight,
      ),
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _textLight,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: _textLight,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _textLight,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _textLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: _textLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: _textLightSecondary,
      ),
    ),
    iconTheme: IconThemeData(
      color: _primaryLight,
      size: 24,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _backgroundLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: _primaryLight.withOpacity(0.5), width: 1),
      ),
      labelStyle: TextStyle(color: _textLightSecondary.withOpacity(0.8)),
      hintStyle: TextStyle(color: _textLightSecondary.withOpacity(0.6)),
      floatingLabelStyle: TextStyle(color: _primaryLight.withOpacity(0.8)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryLight.withOpacity(0.9),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.5,
        shadowColor: _primaryLight.withOpacity(0.3),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryLight,
        side: BorderSide(color: _primaryLight),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: _dividerLight,
      thickness: 1,
      space: 24,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: _surfaceLight,
      labelStyle: TextStyle(color: _textLight),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryLight;
        }
        return _textLightSecondary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryLight.withOpacity(0.5);
        }
        return _textLightSecondary.withOpacity(0.3);
      }),
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

        displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _textDark,
      ),
      
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
