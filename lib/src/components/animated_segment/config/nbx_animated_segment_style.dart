import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/animated_segment/config/nbx_animated_segment_defaults.dart';
import 'package:nebux_design_system/src/components/animated_segment/nbx_animated_segment_theme.dart';

/// Visual geometry and color overrides for [NbxAnimatedSegment].
class NbxAnimatedSegmentStyle {
  /// Gutter between the track edge and the sliding pill [double].
  final double trackPadding;

  /// Track background color override [Color?].
  final Color? trackColor;

  /// Selected pill background color override [Color?].
  final Color? selectedColor;

  /// Label color when the segment is selected [Color?].
  final Color? selectedLabelColor;

  /// Label color when the segment is unselected [Color?].
  final Color? unselectedLabelColor;

  /// Selected pill shadow override [List<BoxShadow>?].
  final List<BoxShadow>? selectedShadow;

  /// Outer track corner radius [double].
  final double trackBorderRadius;

  /// Track border color; omit for no border [Color?].
  final Color? trackBorderColor;

  /// Track border width [double].
  final double trackBorderWidth;

  /// Selected pill corner radius override [double?].
  final double? selectedBorderRadius;

  /// Creates a [NbxAnimatedSegmentStyle] instance.
  ///
  /// @param trackPadding: Gutter between track and pill [double].
  /// @param trackColor: Track background override [Color?].
  /// @param selectedColor: Selected pill background override [Color?].
  /// @param selectedLabelColor: Selected label color override [Color?].
  /// @param unselectedLabelColor: Unselected label color override [Color?].
  /// @param selectedShadow: Selected pill shadow override [List<BoxShadow>?].
  /// @param trackBorderRadius: Outer track radius [double].
  /// @param trackBorderColor: Track border color [Color?].
  /// @param trackBorderWidth: Track border width [double].
  /// @param selectedBorderRadius: Pill radius override [double?].
  const NbxAnimatedSegmentStyle({
    this.trackPadding = NbxAnimatedSegmentDefaults.trackPadding,
    this.trackColor,
    this.selectedColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.selectedShadow,
    this.trackBorderRadius = NbxAnimatedSegmentDefaults.trackBorderRadius,
    this.trackBorderColor,
    this.trackBorderWidth = 1,
    this.selectedBorderRadius,
  });

  /// Inset pill with gutter between track and selected pill.
  const NbxAnimatedSegmentStyle.inset({
    double? trackPadding,
    Color? trackColor,
    Color? selectedColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    List<BoxShadow>? selectedShadow,
    double? trackBorderRadius,
    Color? trackBorderColor,
    double trackBorderWidth = 1,
    double? selectedBorderRadius,
  }) : this(
          trackPadding: trackPadding ?? NbxAnimatedSegmentDefaults.trackPadding,
          trackColor: trackColor,
          selectedColor: selectedColor,
          selectedLabelColor: selectedLabelColor,
          unselectedLabelColor: unselectedLabelColor,
          selectedShadow: selectedShadow,
          trackBorderRadius:
              trackBorderRadius ?? NbxAnimatedSegmentDefaults.trackBorderRadius,
          trackBorderColor: trackBorderColor,
          trackBorderWidth: trackBorderWidth,
          selectedBorderRadius: selectedBorderRadius,
        );

  /// Flush pill that fills the track without gutter padding.
  const NbxAnimatedSegmentStyle.flush({
    Color? trackColor,
    Color? selectedColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    double trackBorderRadius = NbxAnimatedSegmentDefaults.trackBorderRadius,
    Color? trackBorderColor,
    double trackBorderWidth = 1,
  }) : this(
          trackPadding: 0,
          trackColor: trackColor,
          selectedColor: selectedColor,
          selectedLabelColor: selectedLabelColor,
          unselectedLabelColor: unselectedLabelColor,
          selectedShadow: const [],
          trackBorderRadius: trackBorderRadius,
          trackBorderColor: trackBorderColor,
          trackBorderWidth: trackBorderWidth,
          selectedBorderRadius: trackBorderRadius,
        );

  /// Resolves geometry and colors using [theme] and optional overrides.
  ///
  /// @param theme: Theme tokens [NbxAnimatedSegmentThemeData].
  ///
  /// @returns: Fully resolved style values [NbxResolvedAnimatedSegmentStyle].
  NbxResolvedAnimatedSegmentStyle resolve(NbxAnimatedSegmentThemeData theme) {
    final hasGutter = trackPadding > 0;
    final resolvedSelectedRadius =
        selectedBorderRadius ??
        (hasGutter
            ? NbxAnimatedSegmentDefaults.innerBorderRadius
            : trackBorderRadius);

    final List<BoxShadow>? resolvedShadow;
    if (selectedShadow != null) {
      resolvedShadow = selectedShadow!.isEmpty ? null : selectedShadow;
    } else {
      resolvedShadow =
          hasGutter ? NbxAnimatedSegmentDefaults.selectedShadow : null;
    }

    return NbxResolvedAnimatedSegmentStyle(
      trackPadding: trackPadding,
      trackColor: trackColor ?? theme.trackColor,
      selectedColor: selectedColor ?? theme.selectedColor,
      selectedLabelColor: selectedLabelColor ?? theme.selectedLabelColor,
      unselectedLabelColor: unselectedLabelColor ?? theme.unselectedLabelColor,
      trackBorderRadius: trackBorderRadius,
      trackBorderColor: trackBorderColor,
      trackBorderWidth: trackBorderWidth,
      selectedBorderRadius: resolvedSelectedRadius,
      selectedShadow: resolvedShadow,
    );
  }
}

/// Resolved segment style with concrete colors and radii.
class NbxResolvedAnimatedSegmentStyle {
  /// Gutter between the track edge and the sliding pill [double].
  final double trackPadding;

  /// Track background color [Color].
  final Color trackColor;

  /// Selected pill background color [Color].
  final Color selectedColor;

  /// Label color when the segment is selected [Color].
  final Color selectedLabelColor;

  /// Label color when the segment is unselected [Color].
  final Color unselectedLabelColor;

  /// Outer track corner radius [double].
  final double trackBorderRadius;

  /// Track border color [Color?].
  final Color? trackBorderColor;

  /// Track border width [double].
  final double trackBorderWidth;

  /// Selected pill corner radius [double].
  final double selectedBorderRadius;

  /// Selected pill shadow [List<BoxShadow>?].
  final List<BoxShadow>? selectedShadow;

  /// Creates a [NbxResolvedAnimatedSegmentStyle] instance.
  const NbxResolvedAnimatedSegmentStyle({
    required this.trackPadding,
    required this.trackColor,
    required this.selectedColor,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
    required this.trackBorderRadius,
    required this.trackBorderColor,
    required this.trackBorderWidth,
    required this.selectedBorderRadius,
    required this.selectedShadow,
  });

  /// Returns the label text style for a segment option.
  ///
  /// @param theme: Theme tokens for typography [NbxAnimatedSegmentThemeData].
  /// @param isSelected: Whether the option is selected [bool].
  ///
  /// @returns: Label text style [TextStyle].
  TextStyle labelStyle(
    NbxAnimatedSegmentThemeData theme, {
    required bool isSelected,
  }) {
    return TextStyle(
      fontSize: theme.labelFontSize,
      fontWeight:
          isSelected ? theme.selectedFontWeight : theme.unselectedFontWeight,
      color: isSelected ? selectedLabelColor : unselectedLabelColor,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}
