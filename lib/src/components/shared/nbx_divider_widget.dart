import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxDividerWidget extends StatelessWidget {
  final double height;
  final EdgeInsets? padding;
  final Color? color;

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
