import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../../helpers/nebux_test_helpers.dart';

void main() {
  group('NebuxColors', () {
    group('constructor', () {
      test('creates instance with all required fields', () {
        final colors = testNebuxColors();

        expect(colors.primary, equals(const Color(0xFF2196F3)));
        expect(colors.secondary, equals(const Color(0xFF03A9F4)));
        expect(colors.secondaryVariant, equals(const Color(0xFF0288D1)));
        expect(colors.background, equals(const Color(0xFFFFFFFF)));
        expect(colors.textPrimary, equals(const Color(0xFF212121)));
        expect(colors.textSecondary, equals(const Color(0xFF757575)));
        expect(colors.actionPrimary, equals(const Color(0xFF2196F3)));
        expect(colors.actionSecondary, equals(const Color(0xFF03A9F4)));
        expect(colors.cardColor, equals(const Color(0xFFF5F5F5)));
        expect(colors.success, equals(const Color(0xFF4CAF50)));
        expect(colors.warning, equals(const Color(0xFFFFC107)));
        expect(colors.error, equals(const Color(0xFFF44336)));
        expect(colors.info, equals(const Color(0xFF2196F3)));
        expect(colors.disabled, equals(const Color(0xFFBDBDBD)));
        expect(colors.white, equals(const Color(0xFFFFFFFF)));
        expect(colors.black, equals(const Color(0xFF000000)));
      });
    });

    group('fromJson', () {
      test('deserializes from JSON correctly', () {
        final json = {
          'primary': 0xFF2196F3,
          'secondary': 0xFF03A9F4,
          'secondaryVariant': 0xFF0288D1,
          'background': 0xFFFFFFFF,
          'textPrimary': 0xFF212121,
          'textSecondary': 0xFF757575,
          'actionPrimary': 0xFF2196F3,
          'actionSecondary': 0xFF03A9F4,
          'cardColor': 0xFFF5F5F5,
          'success': 0xFF4CAF50,
          'warning': 0xFFFFC107,
          'error': 0xFFF44336,
          'info': 0xFF2196F3,
          'disabled': 0xFFBDBDBD,
          'white': 0xFFFFFFFF,
          'black': 0xFF000000,
          'primaryGradient': {
            'colors': [0xFF2196F3, 0xFF03A9F4],
            'begin': 'Alignment.topLeft',
            'end': 'Alignment.bottomRight',
          },
          'secondaryGradient': {
            'colors': [0xFF03A9F4, 0xFF00BCD4],
            'begin': 'Alignment.topLeft',
            'end': 'Alignment.bottomRight',
          },
        };

        final colors = NebuxColors.fromJson(json);

        expect(colors.primary, equals(const Color(0xFF2196F3)));
        expect(colors.secondary, equals(const Color(0xFF03A9F4)));
        expect(colors.textPrimary, equals(const Color(0xFF212121)));
      });

      test('toJson fromJson roundtrip preserves values', () {
        final original = testNebuxColors();
        final json = original.toJson();
        final restored = NebuxColors.fromJson(json);

        expect(restored.primary, equals(original.primary));
        expect(restored.secondary, equals(original.secondary));
        expect(restored.background, equals(original.background));
        expect(restored.textPrimary, equals(original.textPrimary));
        expect(restored.textSecondary, equals(original.textSecondary));
        expect(restored.error, equals(original.error));
        expect(restored.success, equals(original.success));
      });
    });

    group('lerp', () {
      test('returns a values at t=0.0', () {
        final a = testNebuxColors();
        final b = const NebuxColors(
          primary: Color(0xFF000000),
          secondary: Color(0xFF000000),
          secondaryVariant: Color(0xFF000000),
          background: Color(0xFF000000),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF000000),
          actionPrimary: Color(0xFF000000),
          actionSecondary: Color(0xFF000000),
          cardColor: Color(0xFF000000),
          success: Color(0xFF000000),
          warning: Color(0xFF000000),
          error: Color(0xFF000000),
          info: Color(0xFF000000),
          disabled: Color(0xFF000000),
          white: Color(0xFF000000),
          black: Color(0xFF000000),
          primaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
          secondaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
        );

        final result = NebuxColors.lerp(a, b, 0.0);

        expect(result!.primary, equals(a.primary));
        expect(result.secondary, equals(a.secondary));
        expect(result.textPrimary, equals(a.textPrimary));
      });

      test('returns b values at t=1.0', () {
        final a = testNebuxColors();
        final b = const NebuxColors(
          primary: Color(0xFF000000),
          secondary: Color(0xFF000000),
          secondaryVariant: Color(0xFF000000),
          background: Color(0xFF000000),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF000000),
          actionPrimary: Color(0xFF000000),
          actionSecondary: Color(0xFF000000),
          cardColor: Color(0xFF000000),
          success: Color(0xFF000000),
          warning: Color(0xFF000000),
          error: Color(0xFF000000),
          info: Color(0xFF000000),
          disabled: Color(0xFF000000),
          white: Color(0xFF000000),
          black: Color(0xFF000000),
          primaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
          secondaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
        );

        final result = NebuxColors.lerp(a, b, 1.0);

        expect(result!.primary, equals(b.primary));
        expect(result.secondary, equals(b.secondary));
        expect(result.textPrimary, equals(b.textPrimary));
      });

      test('returns intermediate colors at t=0.5', () {
        const a = NebuxColors(
          primary: Color(0xFF000000),
          secondary: Color(0xFF000000),
          secondaryVariant: Color(0xFF000000),
          background: Color(0xFF000000),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF000000),
          actionPrimary: Color(0xFF000000),
          actionSecondary: Color(0xFF000000),
          cardColor: Color(0xFF000000),
          success: Color(0xFF000000),
          warning: Color(0xFF000000),
          error: Color(0xFF000000),
          info: Color(0xFF000000),
          disabled: Color(0xFF000000),
          white: Color(0xFF000000),
          black: Color(0xFF000000),
          primaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
          secondaryGradient: LinearGradient(colors: [Color(0xFF000000)]),
        );
        const b = NebuxColors(
          primary: Color(0xFFFFFFFF),
          secondary: Color(0xFFFFFFFF),
          secondaryVariant: Color(0xFFFFFFFF),
          background: Color(0xFFFFFFFF),
          textPrimary: Color(0xFFFFFFFF),
          textSecondary: Color(0xFFFFFFFF),
          actionPrimary: Color(0xFFFFFFFF),
          actionSecondary: Color(0xFFFFFFFF),
          cardColor: Color(0xFFFFFFFF),
          success: Color(0xFFFFFFFF),
          warning: Color(0xFFFFFFFF),
          error: Color(0xFFFFFFFF),
          info: Color(0xFFFFFFFF),
          disabled: Color(0xFFFFFFFF),
          white: Color(0xFFFFFFFF),
          black: Color(0xFFFFFFFF),
          primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF)]),
          secondaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF)]),
        );

        final result = NebuxColors.lerp(a, b, 0.5);

        final expectedPrimary = Color.lerp(
          const Color(0xFF000000),
          const Color(0xFFFFFFFF),
          0.5,
        );
        final expectedSecondary = Color.lerp(
          const Color(0xFF000000),
          const Color(0xFFFFFFFF),
          0.5,
        );
        expect(result!.primary, equals(expectedPrimary));
        expect(result.secondary, equals(expectedSecondary));
      });

      test('returns b when a is null', () {
        final b = testNebuxColors();

        final result = NebuxColors.lerp(null, b, 0.5);

        expect(result, equals(b));
      });

      test('returns a when b is null', () {
        final a = testNebuxColors();

        final result = NebuxColors.lerp(a, null, 0.5);

        expect(result, equals(a));
      });

      test('returns null when both are null', () {
        final result = NebuxColors.lerp(null, null, 0.5);

        expect(result, isNull);
      });
    });
  });

  group('NebuxColorThemes', () {
    group('fromJson', () {
      test('deserializes light and dark themes', () {
        final json = {
          'light': {
            'primary': 0xFF2196F3,
            'secondary': 0xFF03A9F4,
            'secondaryVariant': 0xFF0288D1,
            'background': 0xFFFFFFFF,
            'textPrimary': 0xFF212121,
            'textSecondary': 0xFF757575,
            'actionPrimary': 0xFF2196F3,
            'actionSecondary': 0xFF03A9F4,
            'cardColor': 0xFFF5F5F5,
            'success': 0xFF4CAF50,
            'warning': 0xFFFFC107,
            'error': 0xFFF44336,
            'info': 0xFF2196F3,
            'disabled': 0xFFBDBDBD,
            'white': 0xFFFFFFFF,
            'black': 0xFF000000,
            'primaryGradient': {
              'colors': [0xFF2196F3, 0xFF03A9F4],
            },
            'secondaryGradient': {
              'colors': [0xFF03A9F4, 0xFF00BCD4],
            },
          },
          'dark': {
            'primary': 0xFF2196F3,
            'secondary': 0xFF03A9F4,
            'secondaryVariant': 0xFF0288D1,
            'background': 0xFF000000,
            'textPrimary': 0xFFFFFFFF,
            'textSecondary': 0xFFBDBDBD,
            'actionPrimary': 0xFF2196F3,
            'actionSecondary': 0xFF03A9F4,
            'cardColor': 0xFF424242,
            'success': 0xFF4CAF50,
            'warning': 0xFFFFC107,
            'error': 0xFFF44336,
            'info': 0xFF2196F3,
            'disabled': 0xFF424242,
            'white': 0xFFFFFFFF,
            'black': 0xFF000000,
            'primaryGradient': {
              'colors': [0xFF2196F3, 0xFF03A9F4],
            },
            'secondaryGradient': {
              'colors': [0xFF03A9F4, 0xFF00BCD4],
            },
          },
        };

        final themes = NebuxColorThemes.fromJson(json);

        expect(themes.light.background, equals(const Color(0xFFFFFFFF)));
        expect(themes.dark.background, equals(const Color(0xFF000000)));
      });
    });
  });
}
