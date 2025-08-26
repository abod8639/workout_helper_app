import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final _themeMode = 'System'.obs;
  final SharedPreferences _prefs;

  ThemeController(this._prefs);

  String get currentTheme => _themeMode.value;

  // Initialize theme from SharedPreferences
  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  // Load saved theme
  void _loadThemeFromPrefs() {
    final savedTheme = _prefs.getString('theme_mode') ?? 'System';
    _themeMode.value = savedTheme;
    _applyTheme(savedTheme);
  }

  // Update theme
  Future<void> setTheme(String theme) async {
    _themeMode.value = theme;
    await _prefs.setString('theme_mode', theme);
    _applyTheme(theme);
  }

  // Apply theme to GetX
  void _applyTheme(String theme) {
    switch (theme) {
      case 'Light':
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 'Dark':
        Get.changeThemeMode(ThemeMode.dark);
        break;
      default:
        Get.changeThemeMode(ThemeMode.system);
    }
  }
}
