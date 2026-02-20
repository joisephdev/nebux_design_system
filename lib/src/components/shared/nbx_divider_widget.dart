import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A themed divider widget with configurable height, padding, and color.
class NbxDividerWidget extends StatelessWidget {
  /// The total height occupied by the divider (includes whitespace).
  final double height;

  /// Optional padding around the divider.
  final EdgeInsets? padding;

  /// Custom color override. Defaults to the theme divider color.
  final Color? color;

  /// Creates a divider widget.
  const NbxDividerWidget({
    super.key,
    this.height = 40,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Divider(
        thickness: .5,
        height: height,
        color: color ?? context.nebuxColors.divider,
      ),
    );
  }
}
