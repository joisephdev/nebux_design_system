import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/constants/shimmer_constants.dart';
import 'package:nebux_design_system/src/components/shimmers/models/shimmer_skeleton_style.dart';

/// Internal widget that builds the actual container with shimmer styling.
///
/// This widget handles the visual rendering of shimmer containers
/// with proper styling, shadows, and shape configurations.
class ShimmerContainerBuilder extends StatelessWidget {
  /// Style configuration for the container.
  final ShimmerSkeletonStyle style;

  /// Creates a new shimmer container builder.
  ///
  /// @param style: Configuration for container appearance [NbxShimmerContainerStyle].
  const ShimmerContainerBuilder({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.width,
      height: style.height,
      decoration: BoxDecoration(
        shape: style.boxShape,
        color: style.customColor ?? Colors.grey.shade300,
        borderRadius: (style.boxShape == BoxShape.rectangle)
            ? BorderRadius.circular(style.borderRadiusDouble)
            : null,
        boxShadow: ShimmerConstants.defaultShadow,
      ),
    );
  }
}
