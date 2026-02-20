import 'package:flutter/material.dart';

class CountryPickerAppBarConfig {
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool centerAlign;
  final Icon? backIcon;
  final Color? backIconColor;
  final String? title;

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
