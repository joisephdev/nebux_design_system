import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

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
