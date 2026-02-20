import 'package:flutter/material.dart';

class NbxImageAnimationConfig {
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final Curve fadeInCurve;
  final Curve fadeOutCurve;

  const NbxImageAnimationConfig({
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.fadeOutDuration = const Duration(milliseconds: 300),
    this.fadeInCurve = Curves.easeOut,
    this.fadeOutCurve = Curves.easeIn,
  });
}
