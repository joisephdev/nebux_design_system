import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('TextValidationRules', () {
    group('minLength', () {
      test('returns null when text meets minimum length', () {
        final rule = TextValidationRules.minLength(minLength: 5);
        expect(rule.validate('hello'), isNull);
      });

      test('returns error when text is too short', () {
        final rule = TextValidationRules.minLength(minLength: 5);
        expect(
          rule.validate('hi'),
          equals('Text must be at least 5 characters'),
        );
      });

      test('uses custom error text when provided', () {
        final rule = TextValidationRules.minLength(
          minLength: 3,
          errorText: 'Custom error',
        );
        expect(rule.validate('ab'), equals('Custom error'));
      });
    });

    group('maxLength', () {
      test('returns null when text is within max length', () {
        final rule = TextValidationRules.maxLength(maxLength: 5);
        expect(rule.validate('hello'), isNull);
      });

      test('returns error when text exceeds max length', () {
        final rule = TextValidationRules.maxLength(maxLength: 5);
        expect(
          rule.validate('hello world'),
          equals('Text must be at most 5 characters'),
        );
      });
    });

    group('onlyLetters', () {
      test('returns null for letters only', () {
        final rule = TextValidationRules.onlyLetters();
        expect(rule.validate('Hello'), isNull);
        expect(rule.validate('Hola'), isNull);
      });

      test('returns error for text with numbers', () {
        final rule = TextValidationRules.onlyLetters();
        expect(rule.validate('Hello123'), equals('Only letters are allowed'));
      });
    });

    group('noNumbers', () {
      test('returns null for text without numbers', () {
        final rule = TextValidationRules.noNumbers();
        expect(rule.validate('Hello World'), isNull);
      });

      test('returns error for text with numbers', () {
        final rule = TextValidationRules.noNumbers();
        expect(rule.validate('Hello123'), equals('Numbers are not allowed'));
      });
    });
  });

  group('EmailValidationRules', () {
    group('validFormat', () {
      test('returns null for valid email', () {
        final rule = EmailValidationRules.validFormat();
        expect(rule.validate('user@example.com'), isNull);
        expect(rule.validate('test.user@domain.org'), isNull);
      });

      test('returns error for invalid email', () {
        final rule = EmailValidationRules.validFormat();
        expect(rule.validate('invalid'), equals('Invalid email format'));
        expect(rule.validate('no@domain'), equals('Invalid email format'));
      });
    });

    group('minLength', () {
      test('returns null when email meets minimum length', () {
        final rule = EmailValidationRules.minLength(10);
        expect(rule.validate('user@example.com'), isNull);
      });

      test('returns error when email is too short', () {
        final rule = EmailValidationRules.minLength(20);
        expect(
          rule.validate('a@b.co'),
          equals('Email must be at least 20 characters'),
        );
      });
    });

    group('yahooOnly', () {
      test('returns null for Yahoo email', () {
        final rule = EmailValidationRules.yahooOnly();
        expect(rule.validate('user@yahoo.com'), isNull);
      });

      test('returns error for non-Yahoo email', () {
        final rule = EmailValidationRules.yahooOnly();
        expect(
          rule.validate('user@gmail.com'),
          equals('Only Yahoo emails are allowed'),
        );
      });
    });

    group('domainOnly', () {
      test('returns null for specified domain', () {
        final rule = EmailValidationRules.domainOnly('company.com');
        expect(rule.validate('user@company.com'), isNull);
      });

      test('returns error for different domain', () {
        final rule = EmailValidationRules.domainOnly('company.com');
        expect(
          rule.validate('user@gmail.com'),
          equals('Only company.com emails are allowed'),
        );
      });
    });
  });

  group('PasswordValidationRules', () {
    group('minLength', () {
      test('returns null for password meeting minimum length', () {
        final rule = PasswordValidationRules.minLength(6);
        expect(rule.validate('123456'), isNull);
      });

      test('returns error for short password', () {
        final rule = PasswordValidationRules.minLength(8);
        expect(
          rule.validate('123456'),
          equals('Password must be at least 8 characters'),
        );
      });
    });

    group('hasNumbers', () {
      test('returns null when password has numbers', () {
        final rule = PasswordValidationRules.hasNumbers();
        expect(rule.validate('password123'), isNull);
      });

      test('returns error when password has no numbers', () {
        final rule = PasswordValidationRules.hasNumbers();
        expect(
          rule.validate('password'),
          equals('Password must contain at least one number'),
        );
      });
    });

    group('hasLetters', () {
      test('returns null when password has letters', () {
        final rule = PasswordValidationRules.hasLetters();
        expect(rule.validate('password123'), isNull);
      });

      test('returns error when password has no letters', () {
        final rule = PasswordValidationRules.hasLetters();
        expect(
          rule.validate('123456'),
          equals('Password must contain at least one letter'),
        );
      });
    });

    group('hasUppercase', () {
      test('returns null when password has uppercase', () {
        final rule = PasswordValidationRules.hasUppercase();
        expect(rule.validate('Password'), isNull);
      });

      test('returns error when password has no uppercase', () {
        final rule = PasswordValidationRules.hasUppercase();
        expect(
          rule.validate('password'),
          equals('Password must contain at least one uppercase letter'),
        );
      });
    });

    group('hasLowercase', () {
      test('returns null when password has lowercase', () {
        final rule = PasswordValidationRules.hasLowercase();
        expect(rule.validate('Password'), isNull);
      });

      test('returns error when password has no lowercase', () {
        final rule = PasswordValidationRules.hasLowercase();
        expect(
          rule.validate('PASSWORD'),
          equals('Password must contain at least one lowercase letter'),
        );
      });
    });

    group('hasSpecialChars', () {
      test('returns null when password has special characters', () {
        final rule = PasswordValidationRules.hasSpecialChars();
        expect(rule.validate('pass@word'), isNull);
      });

      test('returns error when password has no special characters', () {
        final rule = PasswordValidationRules.hasSpecialChars();
        expect(
          rule.validate('password'),
          equals('Password must contain at least one special character'),
        );
      });
    });

    group('hasNumbersAndLetters', () {
      test('returns null when password has both', () {
        final rule = PasswordValidationRules.hasNumbersAndLetters();
        expect(rule.validate('pass123'), isNull);
      });

      test('returns error when password has only letters', () {
        final rule = PasswordValidationRules.hasNumbersAndLetters();
        expect(
          rule.validate('password'),
          equals('Password must contain both numbers and letters'),
        );
      });

      test('returns error when password has only numbers', () {
        final rule = PasswordValidationRules.hasNumbersAndLetters();
        expect(
          rule.validate('123456'),
          equals('Password must contain both numbers and letters'),
        );
      });
    });
  });
}
