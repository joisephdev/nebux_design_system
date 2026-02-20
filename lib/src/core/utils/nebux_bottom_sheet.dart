import 'package:flutter/material.dart';

/// Mixin providing a convenience method for displaying modal bottom sheets.
mixin NebuxBottomSheet {
  /// Shows a modal bottom sheet with a rounded top border.
  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget body,
    double? height,
    bool isDismissible = true,
    bool enableDrag = false,
    bool isScrollControlled = false,
  }) {
    const borderRadius = BorderRadius.vertical(top: Radius.circular(24.0));
    return showModalBottomSheet<T>(
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
