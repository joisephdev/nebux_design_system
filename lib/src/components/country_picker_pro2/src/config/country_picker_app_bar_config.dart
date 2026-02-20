import 'package:flutter/material.dart';

/// Configuration for the app bar in the country picker dialog.
class CountryPickerAppBarConfig {
  /// Background color of the app bar.
  final Color? backgroundColor;

  /// Text color of the app bar title.
  final Color? textColor;

  /// Font size of the app bar title.
  final double? fontSize;

  /// Font weight of the app bar title.
  final FontWeight? fontWeight;

  /// Font style of the app bar title.
  final FontStyle? fontStyle;

  /// Whether to center-align the app bar title.
  final bool centerAlign;

  /// Custom back button icon.
  final Icon? backIcon;

  /// Color of the back button icon.
  final Color? backIconColor;

  /// Title text displayed in the app bar.
  final String? title;

  /// Creates an app bar configuration.
  const CountryPickerAppBarConfig({
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.centerAlign = true,
    this.backIcon,
    this.backIconColor,
    this.title,
  });
}
