import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nebux_design_system/src/core/utils/nebux_color_converter.dart';

part 'nebux_colors.freezed.dart';
part 'nebux_colors.g.dart';

/// NebuX Core Color System
///
/// Neutral color palette for the NebuX Core design system.
/// Base colors that can be used to build light and dark themes.
/// Colors can be configured via JSON or TOML files.
@freezed
abstract class NebuxColors with _$NebuxColors {
  const factory NebuxColors({
    /// Primary brand color - used for main actions and branding
    @ColorConverter() required Color primary,

    /// Primary variant color - darker shade of primary
    // @ColorConverter() required Color primaryVariant,

    /// Secondary color - used for secondary actions
    @ColorConverter() required Color secondary,

    /// Accent color - used for highlights and emphasis
    // @ColorConverter() required Color accent,

    /// Background color
    @ColorConverter() required Color background,

    /// Surface color
    // @ColorConverter() required Color surface,

    /// Text primary color
    @ColorConverter() required Color textPrimary,

    /// Text secondary color
    @ColorConverter() required Color textSecondary,

    /// Action primary color
    @ColorConverter() required Color actionPrimary,

    /// Action secondary color
    @ColorConverter() required Color actionSecondary,

    /// Card color
    @ColorConverter() required Color cardColor,

    /// Success color - for positive actions and states
    @ColorConverter() required Color success,

    /// Warning color - for caution states
    @ColorConverter() required Color warning,

    /// Error color - for error states
    @ColorConverter() required Color error,

    /// Info color - for informational states
    @ColorConverter() required Color info,

    /// White color
    @ColorConverter() required Color white,

    /// Black color
    @ColorConverter() required Color black,

    /// Primary gradient - from primary to secondary
    @LinearGradientConverter() required LinearGradient primaryGradient,

    /// Secondary gradient - from secondary to accent
    @LinearGradientConverter() required LinearGradient secondaryGradient,
  }) = _NebuxColors;

  factory NebuxColors.fromJson(Map<String, dynamic> json) =>
      _$NebuxColorsFromJson(json);

  /// Interpolate between two color schemes
  static NebuxColors? lerp(NebuxColors? c, NebuxColors? o, double t) {
    if (c == null && o == null) return null;
    if (c == null) return o;
    if (o == null) return c;

    return NebuxColors(
      primary: Color.lerp(c.primary, o.primary, t)!,
      // primaryVariant: Color.lerp(c.primaryVariant, o.primaryVariant, t)!,
      secondary: Color.lerp(c.secondary, o.secondary, t)!,
      // accent: Color.lerp(c.accent, o.accent, t)!,
      background: Color.lerp(c.background, o.background, t)!,
      // surface: Color.lerp(c.surface, o.surface, t)!,
      textPrimary: Color.lerp(c.textPrimary, o.textPrimary, t)!,
      textSecondary: Color.lerp(c.textSecondary, o.textSecondary, t)!,
      actionPrimary: Color.lerp(c.actionPrimary, o.actionPrimary, t)!,
      actionSecondary: Color.lerp(c.actionSecondary, o.actionSecondary, t)!,
      cardColor: Color.lerp(c.cardColor, o.cardColor, t)!,
      success: Color.lerp(c.success, o.success, t)!,
      warning: Color.lerp(c.warning, o.warning, t)!,
      error: Color.lerp(c.error, o.error, t)!,
      info: Color.lerp(c.info, o.info, t)!,
      white: Color.lerp(c.white, o.white, t)!,
      black: Color.lerp(c.black, o.black, t)!,
      primaryGradient: c.primaryGradient, // Gradients don't support lerp
      secondaryGradient: c.secondaryGradient, // Gradients don't support lerp
    );
  }
}

/// NebuX Color Themes
///
/// A collection of light and dark color themes.
/// Colors can be configured via JSON or TOML files.
@freezed
abstract class NebuxColorThemes with _$NebuxColorThemes {
  const factory NebuxColorThemes({
    required NebuxColors light,
    required NebuxColors dark,
  }) = _NebuxColorThemes;

  factory NebuxColorThemes.fromJson(Map<String, dynamic> json) =>
      _$NebuxColorThemesFromJson(json);
}
