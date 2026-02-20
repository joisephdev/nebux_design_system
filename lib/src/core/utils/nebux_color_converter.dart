import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// JsonConverter for Color type
class ColorConverter implements JsonConverter<Color, dynamic> {
  const ColorConverter();

  @override
  Color fromJson(dynamic value) => _parseColor(value);

  @override
  int toJson(Color color) => color.toARGB32();

  /// Parse color from various formats (hex string, dynamic, or Color)
  static Color _parseColor(dynamic value) {
    if (value == null) {
      throw ArgumentError('Color value cannot be null');
    }

    if (value is Color) {
      return value;
    }

    if (value is int) {
      return Color(value);
    }

    if (value is String) {
      // Handle hex strings like "#FF0000" or "0xFF0000"
      String hex = value.replaceAll('#', '');
      if (hex.length == 6) {
        hex = 'FF$hex'; // Add alpha channel
      }
      if (hex.length == 8) {
        return Color(int.parse(hex, radix: 16));
      }
      throw ArgumentError('Invalid hex color format: $value');
    }

    throw ArgumentError('Unsupported color format: $value');
  }
}

/// JSON converter for [LinearGradient] that serializes colors and alignment.
class LinearGradientConverter
    implements JsonConverter<LinearGradient, Map<String, dynamic>> {
  const LinearGradientConverter();

  @override
  LinearGradient fromJson(Map<String, dynamic> json) {
    final colors = (json['colors'] as List)
        .map((color) => Color(color as int))
        .toList();

    // Parse alignment from string
    Alignment parseAlignment(String? alignmentStr) {
      switch (alignmentStr) {
        case 'Alignment.topLeft':
          return Alignment.topLeft;
        case 'Alignment.topCenter':
          return Alignment.topCenter;
        case 'Alignment.topRight':
          return Alignment.topRight;
        case 'Alignment.centerLeft':
          return Alignment.centerLeft;
        case 'Alignment.center':
          return Alignment.center;
        case 'Alignment.centerRight':
          return Alignment.centerRight;
        case 'Alignment.bottomLeft':
          return Alignment.bottomLeft;
        case 'Alignment.bottomCenter':
          return Alignment.bottomCenter;
        case 'Alignment.bottomRight':
          return Alignment.bottomRight;
        default:
          return Alignment.topLeft;
      }
    }

    final begin = parseAlignment(json['begin'] as String?);
    final end = parseAlignment(json['end'] as String?);

    return LinearGradient(colors: colors, begin: begin, end: end);
  }

  @override
  Map<String, dynamic> toJson(LinearGradient gradient) {
    return {
      'colors': gradient.colors.map((color) => color.toARGB32()).toList(),
      'begin': gradient.begin.toString(),
      'end': gradient.end.toString(),
    };
  }
}
