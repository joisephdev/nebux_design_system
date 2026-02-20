import 'package:flutter/material.dart';

class NbxImageStyleConfig {
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final Clip clipBehavior;
  final Color? color;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final ImageRepeat repeat;
  final bool matchTextDirection;

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
