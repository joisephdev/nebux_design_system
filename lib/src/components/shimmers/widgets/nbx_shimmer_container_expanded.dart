import 'package:flutter/material.dart';
import '../models/shimmer_skeleton_style.dart';
import '../widgets/nbx_shimmer_animation.dart';
import '../widgets/shimmer_container_builder.dart';

/// A shimmer container that expands to fill available space.
///
/// This widget creates a shimmer container that uses Expanded to fill
/// the available vertical space in its parent widget.
class NbxShimmerContainerExpanded extends StatelessWidget {
  /// Style configuration for the shimmer container.
  final ShimmerSkeletonStyle style;

  /// Creates a new expanded shimmer container widget.
  ///
  /// @param style: Configuration for container appearance [ShimmerSkeletonStyle].
  const NbxShimmerContainerExpanded({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return NbxShimmerAnimation(
      child: Expanded(child: ShimmerContainerBuilder(style: style)),
    );
  }
}
