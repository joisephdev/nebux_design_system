import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('ValidationRule', () {
    group('validate', () {
      test('returns null when valid', () {
        final rule = ValidationRule(
          validator: (value) => value.isNotEmpty ? null : 'error',
          errorMessage: 'error',
        );

        expect(rule.validate('test'), isNull);
      });

      test('returns error message when invalid', () {
        final rule = ValidationRule(
          validator: (value) => value.isNotEmpty ? null : 'error',
          errorMessage: 'error',
        );

        expect(rule.validate(''), equals('error'));
      });

      test('skips validation when condition returns false', () {
        final rule = ValidationRule(
          validator: (value) => 'always fails',
          errorMessage: 'error',
          condition: (value) => false,
        );

        expect(rule.validate('test'), isNull);
      });

      test('applies validation when condition returns true', () {
        final rule = ValidationRule(
          validator: (value) => value.length > 3 ? null : 'too short',
          errorMessage: 'too short',
          condition: (value) => value.isNotEmpty,
        );

        expect(rule.validate('test'), isNull);
        expect(rule.validate('ab'), equals('too short'));
      });
    });
  });

  group('CustomValidationRules', () {
    group('regex', () {
      test('returns null for matching pattern', () {
        final rule = CustomValidationRules.regex(
          RegExp(r'^[0-9]+$'),
          'digits only',
        );

        expect(rule.validate('12345'), isNull);
      });

      test('returns error for non-matching pattern', () {
        final rule = CustomValidationRules.regex(
          RegExp(r'^[0-9]+$'),
          'digits only',
        );

        expect(rule.validate('abc'), equals('digits only'));
      });
    });

    group('function', () {
      test('returns null when validator returns true', () {
        final rule = CustomValidationRules.function(
          (value) => value.length > 3,
          'too short',
        );

        expect(rule.validate('test'), isNull);
      });

      test('returns error when validator returns false', () {
        final rule = CustomValidationRules.function(
          (value) => value.length > 3,
          'too short',
        );

        expect(rule.validate('ab'), equals('too short'));
      });
    });
  });
}
