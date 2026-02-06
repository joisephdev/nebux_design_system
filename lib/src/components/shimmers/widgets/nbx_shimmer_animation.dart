import 'package:flutter/material.dart';
import '../constants/shimmer_constants.dart';
import '../widgets/shimmer_animation_wrapper.dart';

/// Base shimmer animation widget that wraps any child with skeleton animation.
///
/// This widget provides the core shimmer animation functionality using
/// flutter_skeleton_ui package with customizable gradient effects.
class NbxShimmerAnimation extends StatelessWidget {
  /// Child widget to be wrapped with shimmer animation.
  final Widget child;

  /// Custom gradient for the shimmer effect. If null, uses default gradient.
  final LinearGradient? gradient;

  /// Creates a new shimmer animation widget.
  ///
  /// @param child: Widget to be animated with shimmer effect [Widget].
  /// @param gradient: Custom gradient configuration [LinearGradient?].
  const NbxShimmerAnimation({super.key, required this.child, this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShimmerAnimationWrapper(
      gradient: gradient ?? ShimmerConstants.defaultGradient,
      child: child,
    );
  }
}
