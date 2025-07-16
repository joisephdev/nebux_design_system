import 'package:shared_preferences/shared_preferences.dart';

/// Utility class for persisting theme preferences
class ThemePreferences {
  static const String _themeKey = 'theme_mode';

  /// Save the current theme mode
  static Future<void> setThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  /// Get the saved theme mode
  static Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false; // Default to light mode
  }

  /// Clear saved theme preference
  static Future<void> clearThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
  }
}
