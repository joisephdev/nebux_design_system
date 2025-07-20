import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nebux_design_system/src/core/utils/nebux_color_converter.dart';

part 'nebux_colors.freezed.dart';
part 'nebux_colors.g.dart';

/// NebuX Core Color System
///
/// Simplified color palette for the NebuX Core design system.
/// Supports both light and dark themes with proper contrast ratios.
/// Colors can be configured via JSON or TOML files.
@freezed
class NebuxColors with _$NebuxColors {
  const factory NebuxColors({
    /// Primary brand color - used for main actions and branding
    @ColorConverter() required Color primary,

    /// Secondary color - used for secondary actions
    @ColorConverter() required Color secondary,

    /// Scaffold background color
    @ColorConverter() required Color scaffold,

    /// Black color
    @ColorConverter() required Color black,

    /// White color
    @ColorConverter() required Color white,

    /// Error color
    @ColorConverter() required Color error,

    /// Disabled color
    @ColorConverter() required Color disabled,

    /// Primary text color
    @ColorConverter() required Color textPrimary,

    /// Secondary text color
    @ColorConverter() required Color textSecondary,
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
      secondary: Color.lerp(c.secondary, o.secondary, t)!,
      scaffold: Color.lerp(c.scaffold, o.scaffold, t)!,
      black: Color.lerp(c.black, o.black, t)!,
      white: Color.lerp(c.white, o.white, t)!,
      error: Color.lerp(c.error, o.error, t)!,
      disabled: Color.lerp(c.disabled, o.disabled, t)!,
      textPrimary: Color.lerp(c.textPrimary, o.textPrimary, t)!,
      textSecondary: Color.lerp(c.textSecondary, o.textSecondary, t)!,
    );
  }
}

/// NebuX Color Themes
///
/// A collection of light and dark color themes.
/// Colors can be configured via JSON or TOML files.
@freezed
class NebuxColorThemes with _$NebuxColorThemes {
  const factory NebuxColorThemes({
    required NebuxColors light,
    required NebuxColors dark,
  }) = _NebuxColorThemes;

  factory NebuxColorThemes.fromJson(Map<String, dynamic> json) =>
      _$NebuxColorThemesFromJson(json);
}
