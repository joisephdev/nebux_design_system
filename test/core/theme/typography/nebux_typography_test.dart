import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  NebuxTypography testTypography() => NebuxTypography.custom('Roboto', null);

  group('NebuxTypography', () {
    group('custom', () {
      test('returns all 10 fields non-null', () {
        final typography = testTypography();

        expect(typography.heading, isNotNull);
        expect(typography.paragraph, isNotNull);
        expect(typography.caption, isNotNull);
        expect(typography.label, isNotNull);
        expect(typography.content, isNotNull);
        expect(typography.section, isNotNull);
        expect(typography.primaryAction, isNotNull);
        expect(typography.secondaryAction, isNotNull);
        expect(typography.formInput, isNotNull);
        expect(typography.placeholder, isNotNull);
      });

      test('uses specified fontFamily', () {
        final typography = NebuxTypography.custom('Arial', null);

        expect(typography.heading.fontFamily, equals('Arial'));
        expect(typography.paragraph.fontFamily, equals('Arial'));
        expect(typography.content.fontFamily, equals('Arial'));
      });

      test('uses standard font sizes', () {
        final typography = testTypography();
        final fontSizes = NebuxFontSize.standard();

        expect(typography.heading.fontSize, equals(fontSizes.heading4));
        expect(typography.paragraph.fontSize, equals(fontSizes.large));
        expect(typography.caption.fontSize, equals(fontSizes.small));
      });

      test('heading has expected fontWeight', () {
        final typography = testTypography();

        expect(typography.heading.fontWeight, equals(FontWeight.w600));
      });

      test('primaryAction has expected fontWeight', () {
        final typography = testTypography();

        expect(typography.primaryAction.fontWeight, equals(FontWeight.w700));
      });

      test('placeholder has italic style', () {
        final typography = testTypography();

        expect(typography.placeholder.fontStyle, equals(FontStyle.italic));
      });

      test('all styles have explicit height', () {
        final typography = testTypography();

        expect(typography.heading.height, isNotNull);
        expect(typography.section.height, isNotNull);
        expect(typography.content.height, isNotNull);
        expect(typography.paragraph.height, isNotNull);
        expect(typography.caption.height, isNotNull);
        expect(typography.label.height, isNotNull);
        expect(typography.primaryAction.height, isNotNull);
        expect(typography.secondaryAction.height, isNotNull);
        expect(typography.formInput.height, isNotNull);
        expect(typography.placeholder.height, isNotNull);
      });

      test('all styles have explicit letterSpacing', () {
        final typography = testTypography();

        expect(typography.heading.letterSpacing, isNotNull);
        expect(typography.section.letterSpacing, isNotNull);
        expect(typography.content.letterSpacing, isNotNull);
        expect(typography.paragraph.letterSpacing, isNotNull);
        expect(typography.caption.letterSpacing, isNotNull);
        expect(typography.label.letterSpacing, isNotNull);
        expect(typography.primaryAction.letterSpacing, isNotNull);
        expect(typography.secondaryAction.letterSpacing, isNotNull);
        expect(typography.formInput.letterSpacing, isNotNull);
        expect(typography.placeholder.letterSpacing, isNotNull);
      });

      test('heading has tighter letterSpacing for display use', () {
        final typography = testTypography();

        expect(typography.heading.letterSpacing, lessThan(0));
      });

      test('action styles have wider letterSpacing for readability', () {
        final typography = testTypography();

        expect(typography.primaryAction.letterSpacing, greaterThan(0));
        expect(typography.secondaryAction.letterSpacing, greaterThan(0));
      });
    });

    group('withOverrides', () {
      test('overrides only specified values', () {
        final base = testTypography();
        final typography = NebuxTypography.withOverrides(
          base: base,
          heading: TextStyle(
            fontSize: base.heading.fontSize,
            fontWeight: FontWeight.w700,
          ),
        );

        expect(typography.heading.fontWeight, equals(FontWeight.w700));
      });
    });

    group('fromThemeData', () {
      test('returns all fields non-null', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.content, isNotNull);
        expect(typography.paragraph, isNotNull);
        expect(typography.caption, isNotNull);
        expect(typography.heading, isNotNull);
        expect(typography.section, isNotNull);
        expect(typography.label, isNotNull);
        expect(typography.primaryAction, isNotNull);
        expect(typography.secondaryAction, isNotNull);
        expect(typography.formInput, isNotNull);
        expect(typography.placeholder, isNotNull);
      });

      test('maps heading to headlineMedium', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.heading.fontSize, equals(28.0));
      });

      test('maps section to titleLarge', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.section.fontSize, equals(22.0));
      });

      test('maps body roles to body text theme styles', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.content.fontSize, equals(16.0));
        expect(typography.paragraph.fontSize, equals(14.0));
        expect(typography.caption.fontSize, equals(12.0));
      });

      test('maps label to labelLarge', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.label.fontSize, equals(14.0));
      });

      test('primaryAction derives from labelLarge with w700', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.primaryAction.fontWeight, equals(FontWeight.w700));
      });

      test('placeholder derives from bodyMedium with italic', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 28),
            titleLarge: TextStyle(fontSize: 22),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.placeholder.fontStyle, equals(FontStyle.italic));
        expect(typography.placeholder.fontSize, equals(14.0));
      });
    });

    group('merge', () {
      test('returns b values when merged', () {
        final a = NebuxTypography.custom('Roboto', null);
        final b = NebuxTypography.custom('Arial', null);

        final result = a.merge(b);

        expect(result.heading.fontFamily, equals('Arial'));
      });

      test('returns a unchanged when b is null', () {
        final a = NebuxTypography.custom('Roboto', null);

        final result = a.merge(null);

        expect(result.heading.fontFamily, equals('Roboto'));
      });

      test('merges individual fields', () {
        final a = NebuxTypography.custom('Roboto', null);
        final b = NebuxTypography.custom('Arial', null);

        final result = a.merge(b);

        expect(result.heading.fontFamily, equals('Arial'));
        expect(result.paragraph.fontFamily, equals('Arial'));
      });
    });
  });
}
