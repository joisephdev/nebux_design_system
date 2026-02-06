import 'package:flutter/material.dart';

/// Configuration class for shimmer container styling.
///
/// This class defines the visual properties of a shimmer container,
/// including dimensions, shape, and appearance settings.
class ShimmerSkeletonStyle {
  /// Width of the shimmer container.
  final double width;

  /// Height of the shimmer container. If null, container will size to content.
  final double? height;

  /// Border radius for rectangular containers.
  final double borderRadiusDouble;

  /// Shape of the container (rectangle or circle).
  final BoxShape boxShape;

  /// Custom color override for the shimmer container.
  final Color? customColor;

  /// Creates a new shimmer container style configuration.
  ///
  /// @param width: Width of the container [double].
  /// @param height: Height of the container, optional [double?].
  /// @param borderRadiusDouble: Border radius for rectangular shapes [double].
  /// @param boxShape: Shape of the container [BoxShape].
  /// @param customColor: Custom color override [Color?].
  const ShimmerSkeletonStyle({
    required this.width,
    this.height,
    this.borderRadiusDouble = 8.0,
    this.boxShape = BoxShape.rectangle,
    this.customColor,
  });

  /// Creates a copy of this style with modified properties.
  ///
  /// @param width: New width value [double?].
  /// @param height: New height value [double?].
  /// @param borderRadiusDouble: New border radius value [double?].
  /// @param boxShape: New box shape [BoxShape?].
  /// @param customColor: New custom color [Color?].
  ///
  /// @returns: New ShimmerContainerStyle instance with updated properties [ShimmerSkeletonStyle].
  ShimmerSkeletonStyle copyWith({
    double? width,
    double? height,
    double? borderRadiusDouble,
    BoxShape? boxShape,
    Color? customColor,
  }) {
    return ShimmerSkeletonStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadiusDouble: borderRadiusDouble ?? this.borderRadiusDouble,
      boxShape: boxShape ?? this.boxShape,
      customColor: customColor ?? this.customColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShimmerSkeletonStyle &&
        other.width == width &&
        other.height == height &&
        other.borderRadiusDouble == borderRadiusDouble &&
        other.boxShape == boxShape &&
        other.customColor == customColor;
  }

  @override
  int get hashCode {
    return Object.hash(
      width,
      height,
      borderRadiusDouble,
      boxShape,
      customColor,
    );
  }
}
