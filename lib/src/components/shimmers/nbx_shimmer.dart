import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A shimmer animation widget that wraps its [child] with a skeleton theme.
///
/// Uses the current [NebuxColors] to derive shimmer gradient colors,
/// providing theme-consistent loading placeholders.
class NbxShimmer extends StatelessWidget {
  /// The child widget to wrap with shimmer animation.
  final Widget child;

  /// Custom base color for the shimmer gradient.
  final Color? baseColor;

  /// Custom highlight color for the shimmer gradient.
  final Color? highlightColor;

  /// Creates a shimmer widget.
  const NbxShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.nebuxColors;
    final gradient = LinearGradient(
      colors: <Color>[
        baseColor ?? colors.cardColor,
        highlightColor ?? colors.background,
        baseColor ?? colors.cardColor,
      ],
      stops: const <double>[0.0, 0.5, 1.0],
    );

    return SkeletonTheme(
      themeMode: ThemeMode.system,
      shimmerGradient: gradient,
      child: SkeletonItem(child: child),
    );
  }
}
