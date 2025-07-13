import 'dart:ui';

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
