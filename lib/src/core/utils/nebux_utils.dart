import 'dart:math';

import 'package:flutter/foundation.dart';

class NebuxUtils {
  static String generateRandomTag([String? value]) {
    final random = 100000 + Random().nextInt(900000);
    return '$random-${value ?? ''}';
  }

  /// Validates if a string is not null, not empty, and not just whitespace
  static bool isValidString(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Formats a duration in a human-readable format
  static String formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  /// Capitalizes the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Truncates text to a specified length with ellipsis
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Checks if the current platform is web
  static bool get isWeb => kIsWeb;

  /// Checks if the current platform is mobile
  static bool get isMobile => !isWeb;
}
