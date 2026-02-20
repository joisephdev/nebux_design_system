import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NbxInputValidator', () {
    group('validate', () {
      group('email type', () {
        test('returns null for valid email', () {
          expect(
            NbxInputValidator.validate(
              'user@example.com',
              NbxInputType.email,
              'error',
            ),
            isNull,
          );
        });

        test('returns error for invalid email', () {
          expect(
            NbxInputValidator.validate(
              'notanemail',
              NbxInputType.email,
              'Invalid email',
            ),
            equals('Invalid email'),
          );
        });
      });

      group('password type', () {
        test('returns null for valid password (>=6 chars)', () {
          expect(
            NbxInputValidator.validate(
              'password123',
              NbxInputType.password,
              'error',
            ),
            isNull,
          );
        });

        test('returns error for short password', () {
          expect(
            NbxInputValidator.validate(
              'abc',
              NbxInputType.password,
              'Password too short',
            ),
            equals('Password too short'),
          );
        });
      });

      group('alphabet type', () {
        test('returns null for letters only', () {
          expect(
            NbxInputValidator.validate('hello', NbxInputType.alphabet, 'error'),
            isNull,
          );
        });

        test('returns error for text with numbers', () {
          expect(
            NbxInputValidator.validate(
              'hello123',
              NbxInputType.alphabet,
              'Only letters allowed',
            ),
            equals('Only letters allowed'),
          );
        });
      });

      group('number type', () {
        test('returns null for valid number', () {
          expect(
            NbxInputValidator.validate('42', NbxInputType.number, 'error'),
            isNull,
          );
        });

        test('returns error for non-number', () {
          expect(
            NbxInputValidator.validate(
              'hello',
              NbxInputType.number,
              'Not a number',
            ),
            equals('Not a number'),
          );
        });
      });

      group('decimalNumber type', () {
        test('returns null for valid decimal', () {
          expect(
            NbxInputValidator.validate(
              '3.14',
              NbxInputType.decimalNumber,
              'error',
            ),
            isNull,
          );
        });

        test('returns error for invalid decimal', () {
          expect(
            NbxInputValidator.validate(
              'abc',
              NbxInputType.decimalNumber,
              'Invalid decimal',
            ),
            equals('Invalid decimal'),
          );
        });
      });

      group('phone type', () {
        test('returns null for valid phone format', () {
          expect(
            NbxInputValidator.validate(
              '1234567890',
              NbxInputType.phone,
              'error',
            ),
            isNull,
          );
        });
      });

      group('text type', () {
        test('returns null for non-empty text', () {
          expect(
            NbxInputValidator.validate('hello', NbxInputType.text, 'error'),
            isNull,
          );
        });
      });

      group('free type', () {
        test('always returns null', () {
          expect(
            NbxInputValidator.validate('anything', NbxInputType.free, 'error'),
            isNull,
          );
        });
      });

      group('null or empty values', () {
        test('returns error for null value', () {
          expect(
            NbxInputValidator.validate(
              null,
              NbxInputType.email,
              'Required field',
            ),
            equals('Required field'),
          );
        });

        test('returns error for empty string', () {
          expect(
            NbxInputValidator.validate(
              '',
              NbxInputType.email,
              'Required field',
            ),
            equals('Required field'),
          );
        });

        test('returns error for whitespace-only string', () {
          expect(
            NbxInputValidator.validate(
              '   ',
              NbxInputType.email,
              'Required field',
            ),
            equals('Required field'),
          );
        });
      });
    });

    group('validateWithRules', () {
      test('returns null when all rules pass', () {
        final rules = [
          TextValidationRules.minLength(minLength: 3),
          TextValidationRules.onlyLetters(),
        ];

        expect(NbxInputValidator.validateWithRules('hello', rules), isNull);
      });

      test('returns first error when rule fails', () {
        final rules = [
          TextValidationRules.minLength(minLength: 10, errorText: 'Too short'),
          TextValidationRules.onlyLetters(),
        ];

        expect(
          NbxInputValidator.validateWithRules('hi', rules),
          equals('Too short'),
        );
      });

      test('returns null for null value with no rules', () {
        expect(NbxInputValidator.validateWithRules(null, []), isNull);
      });

      test('returns null for empty value with no rules', () {
        expect(NbxInputValidator.validateWithRules('', []), isNull);
      });
    });

    group('validateWithRulesAndCustomError', () {
      test('formats error message', () {
        final rules = [
          TextValidationRules.minLength(minLength: 5, errorText: 'Too short'),
        ];

        expect(
          NbxInputValidator.validateWithRulesAndCustomError(
            'hi',
            rules,
            (error) => 'Custom: $error',
          ),
          equals('Custom: Too short'),
        );
      });

      test('returns null when validation passes', () {
        final rules = [TextValidationRules.minLength(minLength: 3)];

        expect(
          NbxInputValidator.validateWithRulesAndCustomError(
            'hello',
            rules,
            (error) => 'Custom: $error',
          ),
          isNull,
        );
      });
    });

    group('static validators', () {
      group('emailAddress', () {
        test('returns true for valid email', () {
          expect(NbxInputValidator.emailAddress('user@example.com'), isTrue);
        });

        test('returns false for invalid email', () {
          expect(NbxInputValidator.emailAddress('invalid'), isFalse);
        });
      });

      group('password', () {
        test('returns true for password >=6 chars', () {
          expect(NbxInputValidator.password('123456'), isTrue);
        });

        test('returns false for short password', () {
          expect(NbxInputValidator.password('12345'), isFalse);
        });
      });

      group('isValidNumber', () {
        test('returns true for valid number', () {
          expect(NbxInputValidator.isValidNumber('42'), isTrue);
          expect(NbxInputValidator.isValidNumber('3.14'), isTrue);
        });

        test('returns false for non-number', () {
          expect(NbxInputValidator.isValidNumber('hello'), isFalse);
        });
      });

      group('isValidDecimalNumber', () {
        test('returns true for valid decimal', () {
          expect(NbxInputValidator.isValidDecimalNumber('3.14'), isTrue);
          expect(NbxInputValidator.isValidDecimalNumber('42'), isTrue);
        });

        test('returns false for invalid decimal', () {
          expect(NbxInputValidator.isValidDecimalNumber('abc'), isFalse);
        });
      });

      group('onlyText', () {
        test('returns true for letters only', () {
          expect(NbxInputValidator.onlyText('hello'), isTrue);
        });

        test('returns false for text with numbers', () {
          expect(NbxInputValidator.onlyText('hello123'), isFalse);
        });
      });
    });
  });
}
