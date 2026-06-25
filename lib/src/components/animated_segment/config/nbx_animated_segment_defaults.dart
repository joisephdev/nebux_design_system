import 'package:flutter/material.dart';

/// Default layout and motion tokens for [NbxAnimatedSegment].
abstract final class NbxAnimatedSegmentDefaults {
  NbxAnimatedSegmentDefaults._();

  static const double trackPadding = 2;
  static const double trackBorderRadius = 24;
  static const double innerBorderRadius = 20;
  static const double optionVerticalPadding = 0;
  static const double optionHorizontalPadding = 8;
  static const double labelFontSize = 13;
  static const int animationMs = 220;
  static const double disabledOpacity = 0.45;

  /// Subtle shadow for inset selected pills.
  static const List<BoxShadow> selectedShadow = [
    BoxShadow(color: Color(0x14000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  /// Default inner track height derived from label size and touch target.
  static const double trackHeight = 28;

  static const Duration animationDuration = Duration(milliseconds: animationMs);
}
