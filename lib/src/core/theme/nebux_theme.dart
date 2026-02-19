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
  ///
  /// Use [typography] to provide a custom typography instead of [standard()].
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
      scaffoldBackgroundColor: colors.background,
    );
  }
}
