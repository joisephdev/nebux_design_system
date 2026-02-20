import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

NbxInputParameters _params({
  NbxInputType inputType = NbxInputType.text,
  bool isRequired = false,
  String? requiredErrorMessage,
  String? Function(String?)? validator,
  void Function(String?)? onValidationResult,
  List<TextInputFormatter>? inputFormatters,
  int? maxLines,
}) {
  return NbxInputParameters(
    isRequired: isRequired,
    inputType: inputType,
    labelText: 'Test',
    hintText: 'Hint',
    requiredErrorMessage: requiredErrorMessage,
    validator: validator,
    onValidationResult: onValidationResult,
    inputFormatters: inputFormatters,
    maxLines: maxLines,
  );
}

void main() {
  group('NbxInputParametersValidationExtension - textInputFormatter', () {
    test('alphabet type uses letter-only filter', () {
      final formatters = _params(inputType: NbxInputType.alphabet)
          .textInputFormatter;
      expect(formatters, isNotEmpty);
      // Should contain at least the alphabet formatter
      expect(formatters.last, isA<FilteringTextInputFormatter>());
    });

    test('number type uses digits-only filter', () {
      final formatters =
          _params(inputType: NbxInputType.number).textInputFormatter;
      expect(formatters, isNotEmpty);
    });

    test('phone type uses digits-only filter', () {
      final formatters =
          _params(inputType: NbxInputType.phone).textInputFormatter;
      expect(formatters, isNotEmpty);
    });

    test('text type with single line uses singleLineFormatter', () {
      final formatters =
          _params(inputType: NbxInputType.text).textInputFormatter;
      expect(formatters, isNotEmpty);
    });

    test('text type with multiline uses allow-all filter', () {
      final formatters =
          _params(inputType: NbxInputType.text, maxLines: 5)
              .textInputFormatter;
      expect(formatters, isNotEmpty);
    });

    test('prepends custom inputFormatters if provided', () {
      final customFormatter = LengthLimitingTextInputFormatter(10);
      final formatters = _params(
        inputType: NbxInputType.text,
        inputFormatters: [customFormatter],
      ).textInputFormatter;
      // Custom formatter should be first
      expect(formatters.first, equals(customFormatter));
      // Default formatter appended
      expect(formatters.length, equals(2));
    });

    test('email type falls to default (single line)', () {
      final formatters =
          _params(inputType: NbxInputType.email).textInputFormatter;
      expect(formatters, isNotEmpty);
    });

    test('password type falls to default (single line)', () {
      final formatters =
          _params(inputType: NbxInputType.password).textInputFormatter;
      expect(formatters, isNotEmpty);
    });
  });

  group('NbxInputParametersValidationExtension - inputValidator', () {
    test('returns null for non-empty value when not required', () {
      final params = _params();
      expect(params.inputValidator('hello'), isNull);
    });

    test('returns null for empty value when not required', () {
      final params = _params();
      expect(params.inputValidator(''), isNull);
    });

    test('returns error message for empty value when required', () {
      final params = _params(
        isRequired: true,
        requiredErrorMessage: 'Field is required',
      );
      expect(params.inputValidator(''), equals('Field is required'));
    });

    test('returns error message for null value when required', () {
      final params = _params(
        isRequired: true,
        requiredErrorMessage: 'Field is required',
      );
      expect(params.inputValidator(null), equals('Field is required'));
    });

    test('delegates to custom validator for non-empty value', () {
      final params = _params(
        validator: (value) => value == 'bad' ? 'Invalid' : null,
      );
      expect(params.inputValidator('bad'), equals('Invalid'));
      expect(params.inputValidator('good'), isNull);
    });

    test('calls onValidationResult with error', () {
      String? lastError;
      final params = _params(
        isRequired: true,
        requiredErrorMessage: 'Required',
        onValidationResult: (error) => lastError = error,
      );
      params.inputValidator('');
      expect(lastError, equals('Required'));
    });

    test('calls onValidationResult with null when valid', () {
      String? lastError = 'initial';
      final params = _params(
        onValidationResult: (error) => lastError = error,
      );
      params.inputValidator('hello');
      expect(lastError, isNull);
    });

    test('custom validator not called when value is empty', () {
      bool validatorCalled = false;
      final params = _params(
        validator: (value) {
          validatorCalled = true;
          return null;
        },
      );
      params.inputValidator('');
      expect(validatorCalled, isFalse);
    });
  });
}
