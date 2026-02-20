import 'package:flutter/material.dart';

/// A pulsing fade animation that repeatedly fades a child widget in and out.
class HunchAnimation extends StatefulWidget {
  /// Creates a hunch (pulsing) animation.
  const HunchAnimation({super.key, required this.child});

  @override
  State<HunchAnimation> createState() => _HunchAnimationState();

  /// The child widget to animate.
  final Widget child;
}

class _HunchAnimationState extends State<HunchAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.3,
      upperBound: 1,
      animationBehavior: AnimationBehavior.normal,
    );
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: widget.child,
    );
  }
}
