import 'package:flutter/material.dart';

/// Configuration for visual styling of [NbxNetworkImage].
class NbxImageStyleConfig {
  /// Border radius applied to the image container.
  final BorderRadius? borderRadius;

  /// Border drawn around the image container.
  final BoxBorder? border;

  /// Box shadows applied to the image container.
  final List<BoxShadow>? shadow;

  /// Clip behavior for the image container.
  final Clip clipBehavior;

  /// Color filter applied to the image.
  final Color? color;

  /// Blend mode for the color filter.
  final BlendMode? colorBlendMode;

  /// Filter quality for image rendering.
  final FilterQuality filterQuality;

  /// How the image should be repeated if it doesn't fill its bounds.
  final ImageRepeat repeat;

  /// Whether to match the text direction for the image.
  final bool matchTextDirection;

  /// Creates a style configuration.
  const NbxImageStyleConfig({
    this.borderRadius,
    this.border,
    this.shadow,
    this.clipBehavior = Clip.antiAlias,
    this.color,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
  });
}
