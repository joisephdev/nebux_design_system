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
    });

    group('withOverrides', () {
      test('overrides only specified values', () {
        final base = testTypography();
        final typography = NebuxTypography.withOverrides(
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
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
            labelLarge: TextStyle(fontSize: 14),
            labelMedium: TextStyle(fontSize: 12),
            labelSmall: TextStyle(fontSize: 10),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.content, isNotNull);
        expect(typography.paragraph, isNotNull);
        expect(typography.caption, isNotNull);
        expect(typography.heading, isNotNull);
        expect(typography.section, isNotNull);
        expect(typography.label, isNotNull);
      });

      test('extracts values from ThemeData', () {
        final themeData = ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF000000)),
            bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF111111)),
            bodySmall: TextStyle(fontSize: 12, color: Color(0xFF222222)),
            labelLarge: TextStyle(fontSize: 14, color: Color(0xFF333333)),
            labelMedium: TextStyle(fontSize: 12, color: Color(0xFF444444)),
            labelSmall: TextStyle(fontSize: 10, color: Color(0xFF555555)),
          ),
        );

        final typography = NebuxTypography.fromThemeData(themeData);

        expect(typography.content.fontSize, equals(16.0));
        expect(typography.paragraph.fontSize, equals(14.0));
        expect(typography.caption.fontSize, equals(12.0));
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
