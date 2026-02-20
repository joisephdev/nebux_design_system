import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NebuxColors', () {
    group('standardLight', () {
      test('creates light palette with expected values', () {
        final colors = NebuxColors.standardLight();

        expect(colors.primary, equals(const Color(0xFF2196F3)));
        expect(colors.secondary, equals(const Color(0xFF03A9F4)));
        expect(colors.background, equals(const Color(0xFFFFFBFE)));
        expect(colors.surface, equals(const Color(0xFFFFFBFE)));
        expect(colors.textPrimary, equals(const Color(0xFF1C1B1F)));
        expect(colors.textSecondary, equals(const Color(0xFF49454F)));
        expect(colors.divider, equals(const Color(0xFFCAC4D0)));
        expect(colors.overlay, equals(const Color(0x52000000)));
        expect(colors.focus, equals(const Color(0xFF2196F3)));
      });
    });

    group('standardDark', () {
      test('creates dark palette with expected values', () {
        final colors = NebuxColors.standardDark();

        expect(colors.primary, equals(const Color(0xFFD0BCFF)));
        expect(colors.secondary, equals(const Color(0xFFCCC2DC)));
        expect(colors.background, equals(const Color(0xFF1C1B1F)));
        expect(colors.surface, equals(const Color(0xFF1C1B1F)));
        expect(colors.textPrimary, equals(const Color(0xFFE6E1E5)));
        expect(colors.textSecondary, equals(const Color(0xFFCAC4D0)));
        expect(colors.divider, equals(const Color(0xFF49454F)));
        expect(colors.overlay, equals(const Color(0x78000000)));
        expect(colors.focus, equals(const Color(0xFFD0BCFF)));
      });
    });

    group('fromJson', () {
      test('deserializes from JSON correctly', () {
        final json = {
          'primary': 0xFF2196F3,
          'secondary': 0xFF03A9F4,
          'secondaryVariant': 0xFF0288D1,
          'background': 0xFFFFFBFE,
          'surface': 0xFFFFFBFE,
          'textPrimary': 0xFF1C1B1F,
          'textSecondary': 0xFF49454F,
          'actionPrimary': 0xFF2196F3,
          'actionSecondary': 0xFF03A9F4,
          'cardColor': 0xFFF7F2FA,
          'divider': 0xFFCAC4D0,
          'overlay': 0x52000000,
          'focus': 0xFF2196F3,
          'success': 0xFF4CAF50,
          'warning': 0xFFFFC107,
          'error': 0xFFB3261E,
          'info': 0xFF2196F3,
          'disabled': 0xFF1C1B1F,
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
        expect(colors.textPrimary, equals(const Color(0xFF1C1B1F)));
        expect(colors.surface, equals(const Color(0xFFFFFBFE)));
        expect(colors.divider, equals(const Color(0xFFCAC4D0)));
      });

      test('toJson fromJson roundtrip preserves values', () {
        final original = NebuxColors.standardLight();
        final json = original.toJson();
        final restored = NebuxColors.fromJson(json);

        expect(restored.primary, equals(original.primary));
        expect(restored.secondary, equals(original.secondary));
        expect(restored.background, equals(original.background));
        expect(restored.surface, equals(original.surface));
        expect(restored.divider, equals(original.divider));
        expect(restored.textPrimary, equals(original.textPrimary));
        expect(restored.textSecondary, equals(original.textSecondary));
        expect(restored.error, equals(original.error));
        expect(restored.success, equals(original.success));
      });
    });

    group('lerp', () {
      test('returns a values at t=0.0', () {
        final a = NebuxColors.standardLight();
        final b = NebuxColors.standardDark();

        final result = NebuxColorsLerp.lerp(a, b, 0.0);

        expect(result!.primary, equals(a.primary));
        expect(result.secondary, equals(a.secondary));
        expect(result.textPrimary, equals(a.textPrimary));
      });

      test('returns b values at t=1.0', () {
        final a = NebuxColors.standardLight();
        final b = NebuxColors.standardDark();

        final result = NebuxColorsLerp.lerp(a, b, 1.0);

        expect(result!.primary, equals(b.primary));
        expect(result.secondary, equals(b.secondary));
        expect(result.textPrimary, equals(b.textPrimary));
      });

      test('returns intermediate colors at t=0.5', () {
        final a = NebuxColors.standardLight();
        final b = NebuxColors.standardDark();

        final result = NebuxColorsLerp.lerp(a, b, 0.5);

        final expectedPrimary = Color.lerp(a.primary, b.primary, 0.5);
        expect(result!.primary, equals(expectedPrimary));
      });

      test('returns b when a is null', () {
        final b = NebuxColors.standardDark();

        final result = NebuxColorsLerp.lerp(null, b, 0.5);

        expect(result, equals(b));
      });

      test('returns a when b is null', () {
        final a = NebuxColors.standardLight();

        final result = NebuxColorsLerp.lerp(a, null, 0.5);

        expect(result, equals(a));
      });

      test('returns null when both are null', () {
        final result = NebuxColorsLerp.lerp(null, null, 0.5);

        expect(result, isNull);
      });
    });

    group('forBrightness', () {
      test('returns standardLight for Brightness.light', () {
        final colors = NebuxColors.standardLight();
        final result = colors.forBrightness(Brightness.light);

        expect(result.primary, equals(NebuxColors.standardLight().primary));
        expect(
          result.background,
          equals(NebuxColors.standardLight().background),
        );
      });

      test('returns standardDark for Brightness.dark', () {
        final colors = NebuxColors.standardLight();
        final result = colors.forBrightness(Brightness.dark);

        expect(result.primary, equals(NebuxColors.standardDark().primary));
        expect(
          result.background,
          equals(NebuxColors.standardDark().background),
        );
      });
    });

    group('copyWith', () {
      test('overrides only primary when specified', () {
        final original = NebuxColors.standardLight();
        final updated = original.copyWith(primary: const Color(0xFFFF0000));

        expect(updated.primary, equals(const Color(0xFFFF0000)));
        expect(updated.secondary, equals(original.secondary));
        expect(updated.background, equals(original.background));
      });

      test('returns equivalent when no args', () {
        final original = NebuxColors.standardLight();
        final copy = original.copyWith();

        expect(copy.primary, equals(original.primary));
        expect(copy.secondary, equals(original.secondary));
        expect(copy.background, equals(original.background));
        expect(copy.surface, equals(original.surface));
        expect(copy.error, equals(original.error));
      });
    });

    group('standardLight all properties', () {
      test('has all semantic colors set', () {
        final colors = NebuxColors.standardLight();

        expect(colors.secondaryVariant, equals(const Color(0xFF0288D1)));
        expect(colors.actionPrimary, equals(const Color(0xFF2196F3)));
        expect(colors.actionSecondary, equals(const Color(0xFF03A9F4)));
        expect(colors.cardColor, equals(const Color(0xFFF7F2FA)));
        expect(colors.success, equals(const Color(0xFF4CAF50)));
        expect(colors.warning, equals(const Color(0xFFFFC107)));
        expect(colors.error, equals(const Color(0xFFB3261E)));
        expect(colors.info, equals(const Color(0xFF2196F3)));
        expect(colors.disabled, equals(const Color(0xFF1C1B1F)));
        expect(colors.white, equals(const Color(0xFFFFFFFF)));
        expect(colors.black, equals(const Color(0xFF000000)));
      });
    });

    group('standardDark all properties', () {
      test('has all semantic colors set', () {
        final colors = NebuxColors.standardDark();

        expect(colors.secondaryVariant, equals(const Color(0xFF9A82DB)));
        expect(colors.actionPrimary, equals(const Color(0xFFD0BCFF)));
        expect(colors.actionSecondary, equals(const Color(0xFFCCC2DC)));
        expect(colors.cardColor, equals(const Color(0xFF2B2930)));
        expect(colors.success, equals(const Color(0xFF81C784)));
        expect(colors.warning, equals(const Color(0xFFFFD54F)));
        expect(colors.error, equals(const Color(0xFFF2B8B5)));
        expect(colors.info, equals(const Color(0xFF90CAF9)));
        expect(colors.disabled, equals(const Color(0xFFE6E1E5)));
        expect(colors.white, equals(const Color(0xFFFFFFFF)));
        expect(colors.black, equals(const Color(0xFF000000)));
      });
    });
  });

  group('NebuxColorThemes', () {
    group('standard', () {
      test('creates themes with light and dark palettes', () {
        final themes = NebuxColorThemes.standard();

        expect(themes.light, isA<NebuxColors>());
        expect(themes.dark, isA<NebuxColors>());
        expect(themes.light.background, isNot(equals(themes.dark.background)));
      });
    });

    group('getColorsByBrightness', () {
      test('returns light for Brightness.light', () {
        final themes = NebuxColorThemes.standard();

        final result = themes.getColorsByBrightness(Brightness.light);

        expect(result.background, equals(themes.light.background));
      });

      test('returns dark for Brightness.dark', () {
        final themes = NebuxColorThemes.standard();

        final result = themes.getColorsByBrightness(Brightness.dark);

        expect(result.background, equals(themes.dark.background));
      });
    });

    group('fromJson', () {
      test('deserializes light and dark themes', () {
        final json = {
          'light': {
            'primary': 0xFF2196F3,
            'secondary': 0xFF03A9F4,
            'secondaryVariant': 0xFF0288D1,
            'background': 0xFFFFFBFE,
            'surface': 0xFFFFFBFE,
            'textPrimary': 0xFF1C1B1F,
            'textSecondary': 0xFF49454F,
            'actionPrimary': 0xFF2196F3,
            'actionSecondary': 0xFF03A9F4,
            'cardColor': 0xFFF7F2FA,
            'divider': 0xFFCAC4D0,
            'overlay': 0x52000000,
            'focus': 0xFF2196F3,
            'success': 0xFF4CAF50,
            'warning': 0xFFFFC107,
            'error': 0xFFB3261E,
            'info': 0xFF2196F3,
            'disabled': 0xFF1C1B1F,
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
            'primary': 0xFFD0BCFF,
            'secondary': 0xFFCCC2DC,
            'secondaryVariant': 0xFF9A82DB,
            'background': 0xFF1C1B1F,
            'surface': 0xFF1C1B1F,
            'textPrimary': 0xFFE6E1E5,
            'textSecondary': 0xFFCAC4D0,
            'actionPrimary': 0xFFD0BCFF,
            'actionSecondary': 0xFFCCC2DC,
            'cardColor': 0xFF2B2930,
            'divider': 0xFF49454F,
            'overlay': 0x78000000,
            'focus': 0xFFD0BCFF,
            'success': 0xFF81C784,
            'warning': 0xFFFFD54F,
            'error': 0xFFF2B8B5,
            'info': 0xFF90CAF9,
            'disabled': 0xFFE6E1E5,
            'white': 0xFFFFFFFF,
            'black': 0xFF000000,
            'primaryGradient': {
              'colors': [0xFFD0BCFF, 0xFFCCC2DC],
            },
            'secondaryGradient': {
              'colors': [0xFFCCC2DC, 0xFF9A82DB],
            },
          },
        };

        final themes = NebuxColorThemes.fromJson(json);

        expect(themes.light.background, equals(const Color(0xFFFFFBFE)));
        expect(themes.dark.background, equals(const Color(0xFF1C1B1F)));
      });
    });
  });
}
