import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NebuxTheme', () {
    group('custom', () {
      test('creates instance with expected fields', () {
        final colors = testNebuxColors();
        final theme = NebuxTheme.custom(colors: colors);

        expect(theme.colors, equals(colors));
        expect(theme.fontSize, isNotNull);
        expect(theme.typography, isNotNull);
      });

      test('uses provided fontSize', () {
        final colors = testNebuxColors();
        final fontSize = NebuxFontSize.custom(large: 16.0);
        final theme = NebuxTheme.custom(colors: colors, fontSize: fontSize);

        expect(theme.fontSize.large, equals(16.0));
      });

      test('uses provided typography', () {
        final colors = testNebuxColors();
        final typography = NebuxTypography.custom('Arial', null);
        final theme = NebuxTheme.custom(colors: colors, typography: typography);

        expect(theme.typography.heading.fontFamily, equals('Arial'));
      });

      test('defaults fontSize to standard when not provided', () {
        final colors = testNebuxColors();
        final theme = NebuxTheme.custom(colors: colors);

        final standard = NebuxFontSize.standard();
        expect(theme.fontSize.large, equals(standard.large));
        expect(theme.fontSize.small, equals(standard.small));
      });
    });

    group('fromJson', () {
      test('creates theme from JSON map', () {
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
          },
          'secondaryGradient': {
            'colors': [0xFF03A9F4, 0xFF00BCD4],
          },
        };

        final theme = NebuxTheme.fromJson(json);

        expect(theme.colors.primary, equals(const Color(0xFF2196F3)));
        expect(theme.colors.secondary, equals(const Color(0xFF03A9F4)));
      });
    });

    group('copyWith', () {
      test('updates colors only', () {
        final original = testNebuxTheme();
        final newColors = const NebuxColors(
          primary: Color(0xFFFF0000),
          secondary: Color(0xFFFF0000),
          secondaryVariant: Color(0xFFFF0000),
          background: Color(0xFFFFFFFF),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF888888),
          actionPrimary: Color(0xFFFF0000),
          actionSecondary: Color(0xFFFF0000),
          cardColor: Color(0xFFFFFFFF),
          success: Color(0xFF00FF00),
          warning: Color(0xFFFFFF00),
          error: Color(0xFFFF0000),
          info: Color(0xFF0000FF),
          disabled: Color(0xFF888888),
          white: Color(0xFFFFFFFF),
          black: Color(0xFF000000),
          primaryGradient: LinearGradient(colors: [Color(0xFFFF0000)]),
          secondaryGradient: LinearGradient(colors: [Color(0xFFFF0000)]),
        );

        final updated = original.copyWith(colors: newColors);

        expect(updated.colors.primary, equals(const Color(0xFFFF0000)));
        expect(updated.fontSize, equals(original.fontSize));
      });

      test('returns equivalent theme when no args', () {
        final original = testNebuxTheme();
        final copy = original.copyWith();

        expect(copy.colors, equals(original.colors));
        expect(copy.fontSize, equals(original.fontSize));
      });
    });

    group('lerp', () {
      test('returns original at t=0.0', () {
        final a = testNebuxTheme();
        final b = NebuxTheme.custom(
          colors: const NebuxColors(
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
          ),
        );

        final result = a.lerp(b, 0.0);

        expect(result.colors.primary, equals(a.colors.primary));
      });

      test('returns original when other is null', () {
        final theme = testNebuxTheme();

        final result = theme.lerp(null, 0.5);

        expect(result, equals(theme));
      });
    });

    group('createThemeData', () {
      test('creates ThemeData with correct brightness for light mode', () {
        final colors = testNebuxColors();
        final themeData = NebuxTheme.createThemeData(
          isDark: false,
          colors: colors,
          fontSize: NebuxFontSize.standard(),
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(themeData.brightness, equals(Brightness.light));
      });

      test('creates ThemeData with correct brightness for dark mode', () {
        final colors = testNebuxColors();
        final themeData = NebuxTheme.createThemeData(
          isDark: true,
          colors: colors,
          fontSize: NebuxFontSize.standard(),
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(themeData.brightness, equals(Brightness.dark));
      });

      test('registers NebuxTheme as ThemeExtension', () {
        final colors = testNebuxColors();
        final themeData = NebuxTheme.createThemeData(
          isDark: false,
          colors: colors,
          fontSize: NebuxFontSize.standard(),
          typography: NebuxTypography.custom('Roboto', null),
        );

        final extension = themeData.extension<NebuxTheme>();

        expect(extension, isNotNull);
        expect(extension!.colors.primary, equals(colors.primary));
      });

      test('sets scaffoldBackgroundColor from colors', () {
        final colors = testNebuxColors();
        final themeData = NebuxTheme.createThemeData(
          isDark: false,
          colors: colors,
          fontSize: NebuxFontSize.standard(),
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(themeData.scaffoldBackgroundColor, equals(colors.background));
      });
    });
  });
}
