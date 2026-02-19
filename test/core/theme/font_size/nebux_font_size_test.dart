import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NebuxFontSize', () {
    group('standard', () {
      test('returns all 13 sizes with expected values', () {
        final fontSizes = NebuxFontSize.standard();

        expect(fontSizes.extraSmall, equals(8.0));
        expect(fontSizes.small, equals(10.0));
        expect(fontSizes.medium, equals(12.0));
        expect(fontSizes.mediumLarge, equals(13.0));
        expect(fontSizes.large, equals(14.0));
        expect(fontSizes.extraLarge, equals(16.0));
        expect(fontSizes.heading4, equals(18.0));
        expect(fontSizes.heading3, equals(20.0));
        expect(fontSizes.heading2, equals(22.0));
        expect(fontSizes.heading1, equals(24.0));
        expect(fontSizes.display3, equals(28.0));
        expect(fontSizes.display2, equals(32.0));
        expect(fontSizes.display1, equals(36.0));
      });
    });

    group('custom', () {
      test('overrides only specified values', () {
        final fontSizes = NebuxFontSize.custom(large: 16.0);

        expect(fontSizes.large, equals(16.0));
        expect(fontSizes.small, equals(10.0));
        expect(fontSizes.medium, equals(12.0));
      });

      test('with no args returns identical to standard', () {
        final custom = NebuxFontSize.custom();
        final standard = NebuxFontSize.standard();

        expect(custom.extraSmall, equals(standard.extraSmall));
        expect(custom.small, equals(standard.small));
        expect(custom.medium, equals(standard.medium));
        expect(custom.large, equals(standard.large));
      });

      test('can override multiple values', () {
        final fontSizes = NebuxFontSize.custom(
          small: 11.0,
          large: 15.0,
          heading1: 26.0,
        );

        expect(fontSizes.small, equals(11.0));
        expect(fontSizes.large, equals(15.0));
        expect(fontSizes.heading1, equals(26.0));
        expect(fontSizes.medium, equals(12.0));
      });
    });

    group('merge', () {
      test('returns b values when merged', () {
        final a = NebuxFontSize.standard();
        final b = NebuxFontSize.custom(large: 20.0, small: 8.0);

        final result = a.merge(b);

        expect(result.large, equals(20.0));
        expect(result.small, equals(8.0));
      });

      test('returns a unchanged when b is null', () {
        final a = NebuxFontSize.standard();

        final result = a.merge(null);

        expect(result, equals(a));
      });
    });

    group('copyWith', () {
      test('returns same values when no args', () {
        final original = NebuxFontSize.standard();
        final copy = original.copyWith();

        expect(copy.extraSmall, equals(original.extraSmall));
        expect(copy.small, equals(original.small));
        expect(copy.large, equals(original.large));
      });

      test('overrides only specified values', () {
        final original = NebuxFontSize.standard();
        final copy = original.copyWith(small: 11.0);

        expect(copy.small, equals(11.0));
        expect(copy.large, equals(original.large));
        expect(copy.medium, equals(original.medium));
      });
    });
  });
}
