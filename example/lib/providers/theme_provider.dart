import 'package:flutter/material.dart';
import 'package:nebux_core/nebux_core.dart';
import '../utils/theme_preferences.dart';

/// Provider for managing theme state and switching between light and dark themes
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isInitialized = false;

  /// Current theme mode (true for dark, false for light)
  bool get isDarkMode => _isDarkMode;

  /// Whether the theme has been initialized from storage
  bool get isInitialized => _isInitialized;

  /// Current brightness
  Brightness get brightness => _isDarkMode ? Brightness.dark : Brightness.light;

  /// Current NebuxTheme instance
  NebuxTheme get currentNebuxTheme {
    if (_isDarkMode) {
      return _createDarkNebuxTheme();
    } else {
      return _createLightNebuxTheme();
    }
  }

  /// Current colors from NebuxTheme
  NebuxColors get currentColors => currentNebuxTheme.colors;

  /// Current typography from NebuxTheme
  NebuxTypography get currentTypography => currentNebuxTheme.typography;

  /// Current font size from NebuxTheme
  NebuxFontSize get currentFontSize => currentNebuxTheme.fontSize;

  /// Initialize theme from saved preferences
  Future<void> initializeTheme() async {
    if (!_isInitialized) {
      _isDarkMode = await ThemePreferences.getThemeMode();
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await ThemePreferences.setThemeMode(_isDarkMode);
    notifyListeners();
  }

  /// Set theme mode explicitly
  Future<void> setThemeMode(bool isDark) async {
    if (_isDarkMode != isDark) {
      _isDarkMode = isDark;
      await ThemePreferences.setThemeMode(_isDarkMode);
      notifyListeners();
    }
  }

  /// Reset theme to default (light mode)
  Future<void> resetTheme() async {
    _isDarkMode = false;
    await ThemePreferences.clearThemeMode();
    notifyListeners();
  }

  /// Get the current theme data based on the current mode
  ThemeData get currentTheme {
    final nebuxTheme = currentNebuxTheme;
    return NebuxTheme.createThemeData(
      _isDarkMode,
      nebuxTheme.colors,
      nebuxTheme.fontSize,
      nebuxTheme.typography,
    );
  }

  /// Create light NebuxTheme using NebuX Core
  NebuxTheme _createLightNebuxTheme() {
    const colors = NebuxColors(
      primary: Color(0xFFD81B60), // Pink modern (Material Pink 600)
      secondary: Color(0xFF5E35B1), // Deep Purple 600
      scaffold: Color(0xFFF5F5F5), // Light neutral gray
      black: Color(0xFF1C1C1E), // Near-black for soft contrast
      white: Color(0xFFFFFFFF), // Pure white
      error: Color(0xFFB00020), // Material Design error
      disabled: Color(0xFFE0E0E0), // Light gray for disabled
      textPrimary: Color(0xFF1C1C1E), // Primary text color
      textSecondary: Color(0xFF666666), // Secondary text color
    );

    final fontSize = NebuxFontSize.standard();
    final typography = NebuxTypography.standard();

    return NebuxTheme.custom(
      colors: colors,
      fontSize: fontSize,
      typography: typography,
    );
  }

  /// Create dark NebuxTheme using NebuX Core
  NebuxTheme _createDarkNebuxTheme() {
    const colors = NebuxColors(
      primary: Color(0xFF90CAF9), // Sky Blue 300
      secondary: Color(0xFFA5D6A7), // Green 300
      scaffold: Color(0xFF1E1E1E), // Dark neutral surface
      black: Color(0xFF121212), // Soft black
      white: Color(0xFFECECEC), // Off-white for contrast
      error: Color(0xFFCF6679), // Material Design dark error
      disabled: Color(0xFF555555), // Medium gray for dark background
      textPrimary: Color(0xFFECECEC), // Primary text color
      textSecondary: Color(0xFFAAAAAA), // Secondary text color
    );

    final fontSize = NebuxFontSize.standard();
    final typography = NebuxTypography.standard();

    return NebuxTheme.custom(
      colors: colors,
      fontSize: fontSize,
      typography: typography,
    );
  }
}
