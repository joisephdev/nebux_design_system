import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import '../hunch_animation.dart';

/// Internal wrapper widget that handles the shimmer animation implementation.
///
/// This widget encapsulates the HunchAnimation and SkeletonTheme setup
/// for consistent shimmer behavior across the design system.
class ShimmerAnimationWrapper extends StatelessWidget {
  /// Child widget to be wrapped with shimmer animation.
  final Widget child;

  /// Gradient configuration for the shimmer effect.
  final LinearGradient gradient;

  /// Creates a new shimmer animation wrapper.
  ///
  /// @param child: Widget to be animated [Widget].
  /// @param gradient: Gradient configuration for shimmer effect [LinearGradient].
  const ShimmerAnimationWrapper({
    super.key,
    required this.child,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return HunchAnimation(
      child: SkeletonTheme(
        themeMode: ThemeMode.system,
        shimmerGradient: gradient,
        child: SkeletonItem(child: child),
      ),
    );
  }
}
