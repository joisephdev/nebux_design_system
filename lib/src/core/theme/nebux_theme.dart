import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Main theme class that integrates colors, typography, and spacing.
/// Provides a comprehensive design system for the NebuX Core application.
class NebuxTheme extends ThemeExtension<NebuxTheme> {
  final NebuxColors colors;
  final NebuxFontSize fontSize;
  final NebuxTypography typography;

  const NebuxTheme._({
    required this.colors,
    required this.fontSize,
    required this.typography,
  });

  /// This allows users to define their own theme colors
  factory NebuxTheme.custom({
    required NebuxColors colors,
    NebuxFontSize? fontSize,
    NebuxTypography? typography,
  }) {
    return NebuxTheme._(
      colors: colors,
      fontSize: fontSize ?? NebuxFontSize.standard(),
      typography: typography ?? NebuxTypography.standard(),
    );
  }

  /// This allows users to load their theme from JSON data
  static NebuxTheme fromJson(Map<String, dynamic> json) {
    final colors = NebuxColors.fromJson(json);
    return NebuxTheme.custom(colors: colors);
  }

  /// This allows users to provide both light and dark themes and select one
  static NebuxTheme fromColorThemes({
    required NebuxColorThemes colorThemes,
    required Brightness brightness,
    NebuxTypography? typography,
  }) {
    final colors = colorThemes.getColorsByBrightness(brightness);
    return NebuxTheme.custom(colors: colors, typography: typography);
  }

  @override
  NebuxTheme copyWith({
    NebuxColors? colors,
    NebuxFontSize? fontSize,
    NebuxTypography? typography,
  }) {
    return NebuxTheme._(
      colors: colors ?? this.colors,
      fontSize: fontSize ?? this.fontSize,
      typography: typography ?? this.typography,
    );
  }

  @override
  NebuxTheme lerp(NebuxTheme? other, double t) {
    if (other == null) return this;

    final nebuxColors = NebuxColors.lerp(colors, other.colors, t) ?? colors;
    return NebuxTheme._(
      colors: nebuxColors,
      fontSize: other.fontSize,
      typography: other.typography,
    );
  }

  /// ThemeData for Flutter's Material App
  static ThemeData createThemeData(
    bool isDark,
    NebuxColors colors,
    NebuxFontSize fontSize,
    NebuxTypography typography,
  ) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      // Extensions
      extensions: <ThemeExtension<NebuxTheme>>[
        NebuxTheme._(
          colors: colors,
          fontSize: fontSize,
          typography: typography,
        ),
      ],
      // Color scheme
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary,
        onPrimary: colors.white,
        secondary: colors.secondary,
        onSecondary: colors.black,
        error: colors.error,
        onError: colors.white,
        surface: colors.white,
        onSurface: colors.black,
        surfaceContainerHighest: colors.white,
        onSurfaceVariant: colors.black,
        outline: colors.black,
        shadow: colors.black,
        scrim: colors.black,
        inverseSurface: colors.black,
        onInverseSurface: colors.white,
        inversePrimary: colors.primary,
        surfaceTint: colors.primary,
      ),

      // Scaffold
      scaffoldBackgroundColor: colors.scaffold,

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: colors.scaffold,
        foregroundColor: colors.black,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: typography.heading,
        iconTheme: IconThemeData(color: colors.black, size: 24),
        actionsIconTheme: IconThemeData(color: colors.black, size: 24),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.scaffold,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.black,
        selectedLabelStyle: typography.label,
        unselectedLabelStyle: typography.label,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: colors.white,
        elevation: 2,
        shadowColor: colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: typography.label,
        hintStyle: typography.label,
        errorStyle: typography.content,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          shadowColor: colors.black,
          textStyle: typography.primaryAction,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.primaryAction,
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: typography.primaryAction,
        ),
      ),

      // Filled button theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.primaryAction,
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colors.black,
        thickness: 1,
        space: 1,
      ),

      // Icon theme
      iconTheme: IconThemeData(color: colors.black, size: 24),

      // Text theme
      textTheme: TextTheme(
        // Display text styles
        displayLarge: typography.heading,
        displayMedium: typography.heading,
        displaySmall: typography.heading,

        // Headline text styles
        headlineLarge: typography.heading,
        headlineMedium: typography.heading,
        headlineSmall: typography.heading,
        // Title text styles
        titleLarge: typography.heading,
        titleMedium: typography.heading,
        titleSmall: typography.heading,

        // Body text styles
        bodyLarge: typography.content,
        bodyMedium: typography.content,
        bodySmall: typography.content,
        // Label text styles
        labelLarge: typography.label,
        labelMedium: typography.label,
        labelSmall: typography.label,
      ),
    );
  }
}
