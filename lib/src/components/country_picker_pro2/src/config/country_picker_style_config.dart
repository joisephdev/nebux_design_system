import 'package:flutter/material.dart';

class CountryPickerStyleConfig {
  final double? flagSize;
  final double? flagBorderWidth;
  final Color? flagBorderColor;
  final double? countryFontSize;
  final FontWeight? countryFontWeight;
  final double? dialCodeFontSize;
  final FontWeight? dialCodeFontWeight;
  final Color? countryFontColor;
  final Color? dialCodeFontColor;
  final BoxShape shape;

  const CountryPickerStyleConfig({
    this.flagSize,
    this.flagBorderWidth,
    this.flagBorderColor,
    this.countryFontSize,
    this.countryFontWeight,
    this.dialCodeFontSize,
    this.dialCodeFontWeight,
    this.countryFontColor,
    this.dialCodeFontColor,
    this.shape = BoxShape.rectangle,
  });
}
