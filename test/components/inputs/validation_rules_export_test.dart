import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('ValidationRules Export', () {
    test('TextValidationRules is accessible', () {
      expect(TextValidationRules, isNotNull);
    });

    test('EmailValidationRules is accessible', () {
      expect(EmailValidationRules, isNotNull);
    });

    test('PasswordValidationRules is accessible', () {
      expect(PasswordValidationRules, isNotNull);
    });

    test('NumberValidationRules is accessible', () {
      expect(NumberValidationRules, isNotNull);
    });

    test('PhoneValidationRules is accessible', () {
      expect(PhoneValidationRules, isNotNull);
    });

    test('ValidationRule is accessible', () {
      expect(ValidationRule, isNotNull);
    });

    test('TextValidationRules can be instantiated', () {
      final rule = TextValidationRules.minLength(minLength: 5);
      expect(rule, isA<ValidationRule>());
    });

    test('EmailValidationRules can be instantiated', () {
      final rule = EmailValidationRules.validFormat();
      expect(rule, isA<ValidationRule>());
    });

    test('PasswordValidationRules can be instantiated', () {
      final rule = PasswordValidationRules.minLength(8);
      expect(rule, isA<ValidationRule>());
    });

    test('NumberValidationRules can be instantiated', () {
      final rule = NumberValidationRules.minValue(0);
      expect(rule, isA<ValidationRule>());
    });

    test('PhoneValidationRules can be instantiated', () {
      final rule = PhoneValidationRules.validFormat();
      expect(rule, isA<ValidationRule>());
    });
  });
}
