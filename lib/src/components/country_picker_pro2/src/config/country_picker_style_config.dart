import 'package:flutter/material.dart';

/// Configuration for the visual styling of country list items.
class CountryPickerStyleConfig {
  /// Size of the country flag.
  final double? flagSize;

  /// Border width around the flag.
  final double? flagBorderWidth;

  /// Border color around the flag.
  final Color? flagBorderColor;

  /// Font size for the country name.
  final double? countryFontSize;

  /// Font weight for the country name.
  final FontWeight? countryFontWeight;

  /// Font size for the dial code.
  final double? dialCodeFontSize;

  /// Font weight for the dial code.
  final FontWeight? dialCodeFontWeight;

  /// Font color for the country name.
  final Color? countryFontColor;

  /// Font color for the dial code.
  final Color? dialCodeFontColor;

  /// Shape of the flag container (rectangle or circle).
  final BoxShape shape;

  /// Creates a style configuration for country list items.
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
