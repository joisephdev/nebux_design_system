import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Configuration for the loading progress indicator in [NbxNetworkImage].
class NbxImageProgressConfig {
  /// Custom progress indicator builder. When provided, overrides the default.
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  /// Size of the default progress indicator.
  final Size progressIndicatorSize;

  /// Color of the progress indicator.
  final Color? progressIndicatorColor;

  /// Stroke width for the circular progress indicator.
  final double progressIndicatorStrokeWidth;

  /// Background color of the progress indicator track.
  final Color? progressIndicatorBackgroundColor;

  /// Whether to use a circular (true) or linear (false) progress indicator.
  final bool progressIndicatorCircular;

  /// Creates a progress indicator configuration.
  const NbxImageProgressConfig({
    this.progressIndicatorBuilder,
    this.progressIndicatorSize = const Size(20, 20),
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth = 2.0,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorCircular = true,
  });
}
