import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/animated_segment/config/nbx_animated_segment_defaults.dart';
import 'package:nebux_design_system/src/core/theme/nebux_theme.dart';

/// Theme tokens for [NbxAnimatedSegment] label and surface colors.
class NbxAnimatedSegmentThemeData {
  /// Track background color [Color].
  final Color trackColor;

  /// Selected pill background color [Color].
  final Color selectedColor;

  /// Label color when the segment is selected [Color].
  final Color selectedLabelColor;

  /// Label color when the segment is unselected [Color].
  final Color unselectedLabelColor;

  /// Base font size for segment labels [double].
  final double labelFontSize;

  /// Font weight for the selected label [FontWeight].
  final FontWeight selectedFontWeight;

  /// Font weight for unselected labels [FontWeight].
  final FontWeight unselectedFontWeight;

  /// Slide animation duration [Duration].
  final Duration animationDuration;

  /// Opacity applied to disabled segment options [double].
  final double disabledOpacity;

  /// Creates a [NbxAnimatedSegmentThemeData] instance.
  ///
  /// @param trackColor: Track background color [Color].
  /// @param selectedColor: Selected pill background color [Color].
  /// @param selectedLabelColor: Selected label color [Color].
  /// @param unselectedLabelColor: Unselected label color [Color].
  /// @param labelFontSize: Label font size [double].
  /// @param selectedFontWeight: Selected label weight [FontWeight].
  /// @param unselectedFontWeight: Unselected label weight [FontWeight].
  /// @param animationDuration: Slide animation duration [Duration].
  /// @param disabledOpacity: Disabled option opacity [double].
  const NbxAnimatedSegmentThemeData({
    required this.trackColor,
    required this.selectedColor,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
    this.labelFontSize = NbxAnimatedSegmentDefaults.labelFontSize,
    this.selectedFontWeight = FontWeight.w700,
    this.unselectedFontWeight = FontWeight.w500,
    this.animationDuration = NbxAnimatedSegmentDefaults.animationDuration,
    this.disabledOpacity = NbxAnimatedSegmentDefaults.disabledOpacity,
  });

  /// Builds a theme from [NebuxTheme] tokens.
  ///
  /// @param context: Build context [BuildContext].
  ///
  /// @returns: Nebux-backed theme data [NbxAnimatedSegmentThemeData].
  factory NbxAnimatedSegmentThemeData.nebux(BuildContext context) {
    final nebuxTheme = Theme.of(context).extension<NebuxTheme>()!;
    final colors = nebuxTheme.colors;
    final typography = nebuxTheme.typography;

    return NbxAnimatedSegmentThemeData(
      trackColor: colors.divider,
      selectedColor: colors.white,
      selectedLabelColor: colors.textPrimary,
      unselectedLabelColor: colors.textSecondary,
      labelFontSize: typography.content.fontSize ??
          NbxAnimatedSegmentDefaults.labelFontSize,
    );
  }

  /// Builds a theme from Flutter [ThemeData] as a framework-agnostic fallback.
  ///
  /// @param context: Build context [BuildContext].
  ///
  /// @returns: Material-based theme data [NbxAnimatedSegmentThemeData].
  factory NbxAnimatedSegmentThemeData.material(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NbxAnimatedSegmentThemeData(
      trackColor: colorScheme.surfaceContainerHighest,
      selectedColor: colorScheme.surface,
      selectedLabelColor: colorScheme.onSurface,
      unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.55),
    );
  }

  /// Returns the text style for a segment label.
  ///
  /// @param isSelected: Whether the option is selected [bool].
  ///
  /// @returns: Label text style [TextStyle].
  TextStyle labelStyle({required bool isSelected}) {
    return TextStyle(
      fontSize: labelFontSize,
      fontWeight: isSelected ? selectedFontWeight : unselectedFontWeight,
      color: isSelected ? selectedLabelColor : unselectedLabelColor,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}

/// Inherited theme provider for [NbxAnimatedSegment].
class NbxAnimatedSegmentTheme extends InheritedWidget {
  /// Theme data consumed by [NbxAnimatedSegment].
  final NbxAnimatedSegmentThemeData data;

  /// Creates a [NbxAnimatedSegmentTheme] instance.
  ///
  /// @param data: Theme data [NbxAnimatedSegmentThemeData].
  /// @param child: Child widget [Widget].
  const NbxAnimatedSegmentTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Returns the nearest [NbxAnimatedSegmentThemeData].
  ///
  /// Falls back to [NebuxTheme] when available, otherwise Material.
  ///
  /// @param context: Build context [BuildContext].
  ///
  /// @returns: Resolved theme data [NbxAnimatedSegmentThemeData].
  static NbxAnimatedSegmentThemeData of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<NbxAnimatedSegmentTheme>();
    if (inherited != null) {
      return inherited.data;
    }

    if (Theme.of(context).extension<NebuxTheme>() != null) {
      return NbxAnimatedSegmentThemeData.nebux(context);
    }

    return NbxAnimatedSegmentThemeData.material(context);
  }

  @override
  bool updateShouldNotify(NbxAnimatedSegmentTheme oldWidget) {
    return data != oldWidget.data;
  }
}
