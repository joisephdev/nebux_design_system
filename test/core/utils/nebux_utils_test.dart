import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NebuxUtils', () {
    group('generateRandomTag', () {
      test('returns string with 6-digit prefix', () {
        final tag = NebuxUtils.generateRandomTag();

        final parts = tag.split('-');
        expect(parts[0].length, equals(6));
        expect(int.tryParse(parts[0]), isNotNull);
      });

      test('includes suffix when value is provided', () {
        final tag = NebuxUtils.generateRandomTag('myTag');

        expect(tag, endsWith('-myTag'));
      });

      test('ends with dash when no value is provided', () {
        final tag = NebuxUtils.generateRandomTag();

        expect(tag, endsWith('-'));
      });

      test('generates different tags on successive calls', () {
        final tags = List.generate(10, (_) => NebuxUtils.generateRandomTag());
        final uniqueTags = tags.toSet();

        // With 10 calls over 900000 range, duplicates are extremely unlikely
        expect(uniqueTags.length, greaterThan(1));
      });

      test('prefix is between 100000 and 999999', () {
        for (var i = 0; i < 20; i++) {
          final tag = NebuxUtils.generateRandomTag();
          final prefix = int.parse(tag.split('-')[0]);
          expect(prefix, greaterThanOrEqualTo(100000));
          expect(prefix, lessThan(1000000));
        }
      });
    });

    group('isValidString', () {
      test('returns false for null', () {
        expect(NebuxUtils.isValidString(null), isFalse);
      });

      test('returns false for empty string', () {
        expect(NebuxUtils.isValidString(''), isFalse);
      });

      test('returns false for whitespace only', () {
        expect(NebuxUtils.isValidString('   '), isFalse);
      });

      test('returns true for non-empty string', () {
        expect(NebuxUtils.isValidString('hello'), isTrue);
      });

      test('returns true for string with spaces and content', () {
        expect(NebuxUtils.isValidString(' hello '), isTrue);
      });
    });

    group('formatDuration', () {
      test('formats hours and minutes', () {
        final result =
            NebuxUtils.formatDuration(const Duration(hours: 2, minutes: 30));

        expect(result, equals('2h 30m'));
      });

      test('formats minutes and seconds', () {
        final result =
            NebuxUtils.formatDuration(const Duration(minutes: 5, seconds: 15));

        expect(result, equals('5m 15s'));
      });

      test('formats seconds only', () {
        final result =
            NebuxUtils.formatDuration(const Duration(seconds: 45));

        expect(result, equals('45s'));
      });

      test('formats zero duration as 0s', () {
        final result = NebuxUtils.formatDuration(Duration.zero);

        expect(result, equals('0s'));
      });

      test('formats exactly one hour', () {
        final result =
            NebuxUtils.formatDuration(const Duration(hours: 1));

        expect(result, equals('1h 0m'));
      });

      test('formats exactly one minute', () {
        final result =
            NebuxUtils.formatDuration(const Duration(minutes: 1));

        expect(result, equals('1m 0s'));
      });
    });

    group('capitalize', () {
      test('capitalizes first letter', () {
        expect(NebuxUtils.capitalize('hello'), equals('Hello'));
      });

      test('lowercases remaining letters', () {
        expect(NebuxUtils.capitalize('HELLO'), equals('Hello'));
      });

      test('returns empty string for empty input', () {
        expect(NebuxUtils.capitalize(''), equals(''));
      });

      test('handles single character', () {
        expect(NebuxUtils.capitalize('a'), equals('A'));
      });
    });

    group('truncateText', () {
      test('returns text unchanged when shorter than maxLength', () {
        expect(NebuxUtils.truncateText('hi', 10), equals('hi'));
      });

      test('returns text unchanged when equal to maxLength', () {
        expect(NebuxUtils.truncateText('hello', 5), equals('hello'));
      });

      test('truncates and appends ellipsis when longer', () {
        expect(NebuxUtils.truncateText('hello world', 5), equals('hello...'));
      });
    });

    group('isWeb', () {
      test('returns false in test environment', () {
        expect(NebuxUtils.isWeb, isFalse);
      });
    });

    group('isMobile', () {
      test('returns true in test environment (not web)', () {
        expect(NebuxUtils.isMobile, isTrue);
      });
    });
  });
}
