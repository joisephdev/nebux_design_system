import 'package:flutter/material.dart';
import '../models/shimmer_skeleton_style.dart';
import '../widgets/nbx_shimmer_animation.dart';
import '../widgets/shimmer_container_builder.dart';

/// A shimmer container widget that displays a skeleton placeholder.
///
/// This widget creates a skeleton container with customizable styling
/// and applies shimmer animation to simulate loading states.
class NbxShimmerContainer extends StatelessWidget {
  /// Style configuration for the shimmer container.
  final ShimmerSkeletonStyle style;

  /// Creates a new shimmer container widget.
  ///
  /// @param style: Configuration for container appearance [ShimmerSkeletonStyle].
  const NbxShimmerContainer({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return NbxShimmerAnimation(
      child: SizedBox(
        height: style.height,
        child: ShimmerContainerBuilder(style: style),
      ),
    );
  }
}
