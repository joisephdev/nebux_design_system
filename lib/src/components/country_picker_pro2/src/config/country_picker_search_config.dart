import 'package:flutter/material.dart';

/// Configuration for the search bar in the country picker dialog.
class CountryPickerSearchConfig {
  /// Background color of the search bar.
  final Color? backgroundColor;

  /// Text color of the search input.
  final Color? textColor;

  /// Border color of the search bar.
  final Color? borderColor;

  /// Border width of the search bar.
  final double? borderWidth;

  /// Hint text color.
  final Color? hintColor;

  /// Search icon widget.
  final Icon? icon;

  /// Background color of the area surrounding the search bar.
  final Color? outerBackgroundColor;

  /// Hint text displayed when the search bar is empty.
  final String? hintText;

  /// Cursor color for the search input.
  final Color? cursorColor;

  /// Creates a search bar configuration.
  const CountryPickerSearchConfig({
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.hintColor,
    this.icon,
    this.outerBackgroundColor,
    this.hintText,
    this.cursorColor,
  });
}
