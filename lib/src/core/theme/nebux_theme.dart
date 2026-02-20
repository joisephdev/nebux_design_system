import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Main theme class that integrates colors, typography, and spacing.
/// Provides a comprehensive design system for the NebuX Core application.
class NebuxTheme extends ThemeExtension<NebuxTheme> {
  /// The color palette for this theme.
  final NebuxColors colors;

  /// The font size scale for this theme.
  final NebuxFontSize fontSize;

  /// The typography styles for this theme.
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
  ///
  /// Use [typography] to provide a custom typography instead of [NebuxTypography.standard].
  static NebuxTheme fromJson(
    Map<String, dynamic> json, {
    NebuxTypography? typography,
  }) {
    final colors = NebuxColors.fromJson(json);
    return NebuxTheme.custom(colors: colors, typography: typography);
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

    final nebuxColors = NebuxColorsLerp.lerp(colors, other.colors, t) ?? colors;
    return NebuxTheme._(
      colors: nebuxColors,
      fontSize: other.fontSize,
      typography: other.typography,
    );
  }

  /// ThemeData for Flutter's Material App
  ///
  /// Creates a complete Material 3 ThemeData with:
  /// - ColorScheme mapped from NebuxColors
  /// - AppBarTheme, CardTheme, InputDecorationTheme, TextTheme
  /// - NebuxTheme registered as ThemeExtension
  static ThemeData createThemeData({
    required bool isDark,
    required NebuxColors colors,
    required NebuxFontSize fontSize,
    required NebuxTypography typography,
  }) {
    final brightness = isDark ? Brightness.dark : Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: <ThemeExtension<NebuxTheme>>[
        NebuxTheme._(
          colors: colors,
          fontSize: fontSize,
          typography: typography,
        ),
      ],
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.white,
        primaryContainer: colors.secondaryVariant,
        onPrimaryContainer: colors.textPrimary,
        secondary: colors.secondary,
        onSecondary: colors.white,
        secondaryContainer: colors.secondaryVariant,
        onSecondaryContainer: colors.textPrimary,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        error: colors.error,
        onError: colors.white,
        outline: colors.divider,
        outlineVariant: colors.textSecondary,
        shadow: colors.black,
        scrim: colors.overlay,
        inverseSurface: colors.black,
        onInverseSurface: colors.white,
        inversePrimary: colors.primary,
        surfaceTint: colors.primary,
      ),
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        titleTextStyle: typography.heading.copyWith(color: colors.textPrimary),
        iconTheme: IconThemeData(color: colors.textPrimary, size: 24),
        actionsIconTheme: IconThemeData(color: colors.textPrimary, size: 24),
      ),
      cardTheme: CardThemeData(
        color: colors.cardColor,
        elevation: 2,
        shadowColor: colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(8),
      ),
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
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
          borderSide: BorderSide(color: colors.focus, width: 2),
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: colors.actionPrimary,
          foregroundColor: colors.white,
          shadowColor: colors.black,
          textStyle: typography.primaryAction.copyWith(color: colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.actionPrimary,
          side: BorderSide(color: colors.divider),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.secondaryAction.copyWith(
            color: colors.actionPrimary,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.actionPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: typography.secondaryAction.copyWith(
            color: colors.actionPrimary,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.actionPrimary,
          foregroundColor: colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: typography.primaryAction.copyWith(color: colors.white),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.actionPrimary,
        foregroundColor: colors.white,
        elevation: 8,
      ),
      iconTheme: IconThemeData(color: colors.textPrimary, size: 24),
      textTheme: TextTheme(
        displayLarge: typography.heading.copyWith(color: colors.textPrimary),
        displayMedium: typography.heading.copyWith(color: colors.textPrimary),
        displaySmall: typography.heading.copyWith(color: colors.textPrimary),
        headlineLarge: typography.heading.copyWith(color: colors.textPrimary),
        headlineMedium: typography.heading.copyWith(color: colors.textPrimary),
        headlineSmall: typography.heading.copyWith(color: colors.textPrimary),
        titleLarge: typography.section.copyWith(color: colors.textPrimary),
        titleMedium: typography.section.copyWith(color: colors.textPrimary),
        titleSmall: typography.section.copyWith(color: colors.textPrimary),
        bodyLarge: typography.content.copyWith(color: colors.textPrimary),
        bodyMedium: typography.paragraph.copyWith(color: colors.textPrimary),
        bodySmall: typography.caption.copyWith(color: colors.textSecondary),
        labelLarge: typography.label.copyWith(color: colors.textPrimary),
        labelMedium: typography.label.copyWith(color: colors.textSecondary),
        labelSmall: typography.label.copyWith(color: colors.textSecondary),
      ),
    );
  }
}
