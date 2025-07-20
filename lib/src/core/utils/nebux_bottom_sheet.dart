import 'package:flutter/material.dart';

mixin NebuxBottomSheet {
  static showBottomSheet(
    BuildContext context, {
    required Widget body,
    double? height,
    bool isDismissible = true,
    bool enableDrag = false,
    bool isScrollControlled = false,
  }) {
    const borderRadius = BorderRadius.vertical(top: Radius.circular(24.0));
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      builder: (BuildContext context) => SizedBox(
        height: height ?? (MediaQuery.of(context).size.height * .6),
        child: Center(child: body),
      ),
    );
  }
}
