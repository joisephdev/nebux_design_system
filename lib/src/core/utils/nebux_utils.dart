import 'dart:math';

class NebuxUtils {
  static String generateRandomTag([String? value]) {
    final random = 100000 + Random().nextInt(900000);
    return '$random-${value ?? ''}';
  }
}
