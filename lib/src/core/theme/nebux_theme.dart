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
  static ThemeData createThemeData({
    required bool isDark,
    required NebuxColors colors,
    required NebuxFontSize fontSize,
    required NebuxTypography typography,
  }) {
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
    );

    /*  return ThemeData(
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
        primaryContainer: colors.primary,
        secondary: colors.secondary,
        secondaryContainer: colors.secondary,
        surface: colors.background,
        // background: colors.background,
        error: colors.error,
        onPrimary: colors.white,
        onSecondary: colors.white,
        onSurface: colors.textPrimary,
        // onBackground: colors.textPrimary,
        onError: colors.white,
        surfaceContainerHighest: colors.cardColor,
        onSurfaceVariant: colors.textSecondary,
        outline: colors.textSecondary,
        shadow: colors.black,
        scrim: colors.black,
        inverseSurface: colors.black,
        onInverseSurface: colors.white,
        inversePrimary: colors.primary,
        surfaceTint: colors.primary,
      ),

      // Scaffold
      scaffoldBackgroundColor: colors.background,

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: typography.heading.copyWith(color: colors.textPrimary),
        iconTheme: IconThemeData(color: colors.textPrimary, size: 24),
        actionsIconTheme: IconThemeData(color: colors.textPrimary, size: 24),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textSecondary,
        selectedLabelStyle: typography.label.copyWith(color: colors.primary),
        unselectedLabelStyle: typography.label.copyWith(
          color: colors.textSecondary,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: colors.cardColor,
        elevation: 2,
        shadowColor: colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(8),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: typography.formInput.copyWith(color: colors.textSecondary),
        hintStyle: typography.placeholder.copyWith(color: colors.textSecondary),
        errorStyle: typography.caption.copyWith(color: colors.error),
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
          textStyle: typography.primaryAction.copyWith(color: colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.secondaryAction.copyWith(color: colors.primary),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: typography.secondaryAction.copyWith(color: colors.primary),
        ),
      ),

      // Filled button theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.primaryAction.copyWith(color: colors.white),
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colors.textSecondary,
        thickness: 1,
        space: 1,
      ),

      // Icon theme
      iconTheme: IconThemeData(color: colors.textPrimary, size: 24),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: colors.white,
        elevation: 8,
      ),

      // Text theme
      textTheme: TextTheme(
        // Display text styles
        displayLarge: typography.heading.copyWith(color: colors.textPrimary),
        displayMedium: typography.heading.copyWith(color: colors.textPrimary),
        displaySmall: typography.heading.copyWith(color: colors.textPrimary),

        // Headline text styles
        headlineLarge: typography.heading.copyWith(color: colors.textPrimary),
        headlineMedium: typography.heading.copyWith(color: colors.textPrimary),
        headlineSmall: typography.heading.copyWith(color: colors.textPrimary),

        // Title text styles
        titleLarge: typography.section.copyWith(color: colors.textPrimary),
        titleMedium: typography.section.copyWith(color: colors.textPrimary),
        titleSmall: typography.section.copyWith(color: colors.textPrimary),

        // Body text styles
        bodyLarge: typography.content.copyWith(color: colors.textPrimary),
        bodyMedium: typography.paragraph.copyWith(color: colors.textPrimary),
        bodySmall: typography.caption.copyWith(color: colors.textSecondary),

        // Label text styles
        labelLarge: typography.label.copyWith(color: colors.textPrimary),
        labelMedium: typography.label.copyWith(color: colors.textSecondary),
        labelSmall: typography.label.copyWith(color: colors.textSecondary),
      ),
    ); */
  }
}
