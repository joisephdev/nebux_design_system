import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NbxImageProgressConfig {
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final Size progressIndicatorSize;
  final Color? progressIndicatorColor;
  final double progressIndicatorStrokeWidth;
  final Color? progressIndicatorBackgroundColor;
  final bool progressIndicatorCircular;

  const NbxImageProgressConfig({
    this.progressIndicatorBuilder,
    this.progressIndicatorSize = const Size(20, 20),
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth = 2.0,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorCircular = true,
  });
}
