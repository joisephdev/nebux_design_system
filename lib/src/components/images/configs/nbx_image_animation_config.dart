import 'package:flutter/material.dart';

/// Configuration for fade-in/fade-out animations in [NbxNetworkImage].
class NbxImageAnimationConfig {
  /// Duration of the fade-in animation when the image loads.
  final Duration fadeInDuration;

  /// Duration of the fade-out animation when the placeholder hides.
  final Duration fadeOutDuration;

  /// Curve for the fade-in animation.
  final Curve fadeInCurve;

  /// Curve for the fade-out animation.
  final Curve fadeOutCurve;

  /// Creates an animation configuration.
  const NbxImageAnimationConfig({
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.fadeOutDuration = const Duration(milliseconds: 300),
    this.fadeInCurve = Curves.easeOut,
    this.fadeOutCurve = Curves.easeIn,
  });
}
