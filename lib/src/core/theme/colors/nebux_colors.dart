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

    /// Secondary color - used for secondary actions
    @ColorConverter() required Color secondary,

    /// Secondary variant color - darker shade of secondary
    @ColorConverter() required Color secondaryVariant,

    /// Background color
    @ColorConverter() required Color background,

    /// Surface color - for cards and elevated surfaces
    @ColorConverter() required Color surface,

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

    /// Divider color
    @ColorConverter() required Color divider,

    /// Overlay color - for scrim and modal backdrop
    @ColorConverter() required Color overlay,

    /// Focus color - for focus rings and accessibility
    @ColorConverter() required Color focus,

    /// Success color - for positive actions and states
    @ColorConverter() required Color success,

    /// Warning color - for caution states
    @ColorConverter() required Color warning,

    /// Error color - for error states
    @ColorConverter() required Color error,

    /// Info color - for informational states
    @ColorConverter() required Color info,

    /// Disabled color - for disabled states
    @ColorConverter() required Color disabled,

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

  const NebuxColors._();

  /// Standard light color palette inspired by Material 3
  static NebuxColors standardLight() {
    return const NebuxColors(
      primary: Color(0xFF2196F3),
      secondary: Color(0xFF03A9F4),
      secondaryVariant: Color(0xFF0288D1),
      background: Color(0xFFFFFBFE),
      surface: Color(0xFFFFFBFE),
      textPrimary: Color(0xFF1C1B1F),
      textSecondary: Color(0xFF49454F),
      actionPrimary: Color(0xFF2196F3),
      actionSecondary: Color(0xFF03A9F4),
      cardColor: Color(0xFFF7F2FA),
      divider: Color(0xFFCAC4D0),
      overlay: Color(0x52000000),
      focus: Color(0xFF2196F3),
      success: Color(0xFF4CAF50),
      warning: Color(0xFFFFC107),
      error: Color(0xFFB3261E),
      info: Color(0xFF2196F3),
      disabled: Color(0xFF1C1B1F),
      white: Color(0xFFFFFFFF),
      black: Color(0xFF000000),
      primaryGradient: LinearGradient(
        colors: [Color(0xFF2196F3), Color(0xFF03A9F4)],
      ),
      secondaryGradient: LinearGradient(
        colors: [Color(0xFF03A9F4), Color(0xFF00BCD4)],
      ),
    );
  }

  /// Standard dark color palette inspired by Material 3
  static NebuxColors standardDark() {
    return const NebuxColors(
      primary: Color(0xFFD0BCFF),
      secondary: Color(0xFFCCC2DC),
      secondaryVariant: Color(0xFF9A82DB),
      background: Color(0xFF1C1B1F),
      surface: Color(0xFF1C1B1F),
      textPrimary: Color(0xFFE6E1E5),
      textSecondary: Color(0xFFCAC4D0),
      actionPrimary: Color(0xFFD0BCFF),
      actionSecondary: Color(0xFFCCC2DC),
      cardColor: Color(0xFF2B2930),
      divider: Color(0xFF49454F),
      overlay: Color(0x78000000),
      focus: Color(0xFFD0BCFF),
      success: Color(0xFF81C784),
      warning: Color(0xFFFFD54F),
      error: Color(0xFFF2B8B5),
      info: Color(0xFF90CAF9),
      disabled: Color(0xFFE6E1E5),
      white: Color(0xFFFFFFFF),
      black: Color(0xFF000000),
      primaryGradient: LinearGradient(
        colors: [Color(0xFFD0BCFF), Color(0xFFCCC2DC)],
      ),
      secondaryGradient: LinearGradient(
        colors: [Color(0xFFCCC2DC), Color(0xFF9A82DB)],
      ),
    );
  }

  /// Get colors by brightness
  NebuxColors forBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? standardDark() : standardLight();
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

  const NebuxColorThemes._();

  /// Creates standard color themes with Material 3 inspired palettes.
  factory NebuxColorThemes.standard() {
    return NebuxColorThemes(
      light: NebuxColors.standardLight(),
      dark: NebuxColors.standardDark(),
    );
  }

  /// Get colors by brightness
  NebuxColors getColorsByBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }
}

/// Extension to add lerp support to NebuxColors
extension NebuxColorsLerp on NebuxColors {
  /// Interpolate between two color schemes
  static NebuxColors? lerp(NebuxColors? c, NebuxColors? o, double t) {
    if (c == null && o == null) return null;
    if (c == null) return o;
    if (o == null) return c;

    return NebuxColors(
      primary: Color.lerp(c.primary, o.primary, t)!,
      secondary: Color.lerp(c.secondary, o.secondary, t)!,
      secondaryVariant: Color.lerp(c.secondaryVariant, o.secondaryVariant, t)!,
      background: Color.lerp(c.background, o.background, t)!,
      surface: Color.lerp(c.surface, o.surface, t)!,
      textPrimary: Color.lerp(c.textPrimary, o.textPrimary, t)!,
      textSecondary: Color.lerp(c.textSecondary, o.textSecondary, t)!,
      actionPrimary: Color.lerp(c.actionPrimary, o.actionPrimary, t)!,
      actionSecondary: Color.lerp(c.actionSecondary, o.actionSecondary, t)!,
      cardColor: Color.lerp(c.cardColor, o.cardColor, t)!,
      divider: Color.lerp(c.divider, o.divider, t)!,
      overlay: Color.lerp(c.overlay, o.overlay, t)!,
      focus: Color.lerp(c.focus, o.focus, t)!,
      success: Color.lerp(c.success, o.success, t)!,
      warning: Color.lerp(c.warning, o.warning, t)!,
      error: Color.lerp(c.error, o.error, t)!,
      info: Color.lerp(c.info, o.info, t)!,
      disabled: Color.lerp(c.disabled, o.disabled, t)!,
      white: Color.lerp(c.white, o.white, t)!,
      black: Color.lerp(c.black, o.black, t)!,
      primaryGradient: c.primaryGradient,
      secondaryGradient: c.secondaryGradient,
    );
  }
}
