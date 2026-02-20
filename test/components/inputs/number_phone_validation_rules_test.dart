import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NumberValidationRules', () {
    group('validFormat', () {
      test('returns null for valid integer', () {
        final rule = NumberValidationRules.validFormat();
        expect(rule.validate('42'), isNull);
      });

      test('returns null for valid decimal', () {
        final rule = NumberValidationRules.validFormat();
        expect(rule.validate('3.14'), isNull);
      });

      test('returns error for non-number', () {
        final rule = NumberValidationRules.validFormat();
        expect(rule.validate('abc'), equals('Invalid number format'));
      });

      test('uses custom error message', () {
        final rule = NumberValidationRules.validFormat('Not a number');
        expect(rule.validate('abc'), equals('Not a number'));
      });
    });

    group('minValue', () {
      test('returns null when value meets minimum', () {
        final rule = NumberValidationRules.minValue(10);
        expect(rule.validate('10'), isNull);
        expect(rule.validate('15'), isNull);
      });

      test('returns error when value is below minimum', () {
        final rule = NumberValidationRules.minValue(10);
        expect(rule.validate('5'), equals('Value must be at least 10.0'));
      });

      test('returns error for non-number', () {
        final rule = NumberValidationRules.minValue(10);
        expect(rule.validate('abc'), equals('Value must be at least 10.0'));
      });
    });

    group('maxValue', () {
      test('returns null when value is within max', () {
        final rule = NumberValidationRules.maxValue(100);
        expect(rule.validate('100'), isNull);
        expect(rule.validate('50'), isNull);
      });

      test('returns error when value exceeds max', () {
        final rule = NumberValidationRules.maxValue(100);
        expect(rule.validate('150'), equals('Value must be at most 100.0'));
      });

      test('returns error for non-number', () {
        final rule = NumberValidationRules.maxValue(100);
        expect(rule.validate('abc'), equals('Value must be at most 100.0'));
      });
    });
  });

  group('PhoneValidationRules', () {
    group('validFormat', () {
      test('returns null for valid 10-digit phone', () {
        final rule = PhoneValidationRules.validFormat();
        expect(rule.validate('1234567890'), isNull);
      });

      test('returns error for short phone number', () {
        final rule = PhoneValidationRules.validFormat();
        expect(rule.validate('12345'), equals('Invalid phone format'));
      });

      test('returns error for non-digit phone', () {
        final rule = PhoneValidationRules.validFormat();
        expect(rule.validate('abcdefghij'), equals('Invalid phone format'));
      });

      test('uses custom error message', () {
        final rule = PhoneValidationRules.validFormat('Bad phone');
        expect(rule.validate('123'), equals('Bad phone'));
      });
    });

    group('minLength', () {
      test('returns null when length meets minimum', () {
        final rule = PhoneValidationRules.minLength(7);
        expect(rule.validate('1234567'), isNull);
        expect(rule.validate('12345678'), isNull);
      });

      test('returns error when length is below minimum', () {
        final rule = PhoneValidationRules.minLength(7);
        expect(
          rule.validate('123'),
          equals('Phone must be at least 7 digits'),
        );
      });
    });
  });
}
