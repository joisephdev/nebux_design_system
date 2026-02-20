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
        final theme = NebuxTheme.custom(
          colors: colors,
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(theme.colors, equals(colors));
        expect(theme.fontSize, isNotNull);
        expect(theme.typography, isNotNull);
      });

      test('uses provided fontSize', () {
        final colors = testNebuxColors();
        final fontSize = NebuxFontSize.custom(large: 16.0);
        final theme = NebuxTheme.custom(
          colors: colors,
          fontSize: fontSize,
          typography: NebuxTypography.custom('Roboto', null),
        );

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
        final theme = NebuxTheme.custom(
          colors: colors,
          typography: NebuxTypography.custom('Roboto', null),
        );

        final standard = NebuxFontSize.standard();
        expect(theme.fontSize.large, equals(standard.large));
        expect(theme.fontSize.small, equals(standard.small));
      });
    });

    group('fromJson', () {
      test('creates theme from JSON map', () {
        final json = <String, dynamic>{
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
          'primaryGradient': <String, dynamic>{
            'colors': <int>[0xFF2196F3, 0xFF03A9F4],
          },
          'secondaryGradient': <String, dynamic>{
            'colors': <int>[0xFF03A9F4, 0xFF00BCD4],
          },
        };

        final theme = NebuxTheme.fromJson(
          json,
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(theme.colors.primary, equals(const Color(0xFF2196F3)));
        expect(theme.colors.secondary, equals(const Color(0xFF03A9F4)));
      });
    });

    group('copyWith', () {
      test('updates colors only', () {
        final original = testNebuxTheme();
        final newColors = NebuxColors.standardDark();

        final updated = original.copyWith(colors: newColors);

        expect(updated.colors.primary, equals(newColors.primary));
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
          colors: NebuxColors.standardDark(),
          typography: NebuxTypography.custom('Roboto', null),
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

    group('fromColorThemes', () {
      test('selects light colors for Brightness.light', () {
        final themes = NebuxColorThemes.standard();
        final theme = NebuxTheme.fromColorThemes(
          colorThemes: themes,
          brightness: Brightness.light,
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(theme.colors.primary, equals(themes.light.primary));
        expect(theme.colors.background, equals(themes.light.background));
      });

      test('selects dark colors for Brightness.dark', () {
        final themes = NebuxColorThemes.standard();
        final theme = NebuxTheme.fromColorThemes(
          colorThemes: themes,
          brightness: Brightness.dark,
          typography: NebuxTypography.custom('Roboto', null),
        );

        expect(theme.colors.primary, equals(themes.dark.primary));
        expect(theme.colors.background, equals(themes.dark.background));
      });

      test('uses custom typography when provided', () {
        final themes = NebuxColorThemes.standard();
        final typography = NebuxTypography.custom('Arial', null);
        final theme = NebuxTheme.fromColorThemes(
          colorThemes: themes,
          brightness: Brightness.light,
          typography: typography,
        );

        expect(theme.typography.heading.fontFamily, equals('Arial'));
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
