import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

NbxInputParameters _params({
  NbxInputType inputType = NbxInputType.text,
  bool isReadOnly = false,
  bool isEnabled = true,
  Widget? suffixIcon,
  NbxSuffixIconType suffixIconType = NbxSuffixIconType.none,
  TextEditingController? controller,
}) {
  return NbxInputParameters(
    isRequired: false,
    inputType: inputType,
    labelText: 'Test',
    hintText: 'Hint',
    isReadOnly: isReadOnly,
    isEnabled: isEnabled,
    suffixIcon: suffixIcon,
    suffixIconType: suffixIconType,
    controller: controller,
  );
}

void main() {
  group('NbxInputParametersExtension - keyboardType', () {
    test('returns TextInputType.number for number type', () {
      expect(
        _params(inputType: NbxInputType.number).keyboardType,
        TextInputType.number,
      );
    });

    test('returns TextInputType.emailAddress for email type', () {
      expect(
        _params(inputType: NbxInputType.email).keyboardType,
        TextInputType.emailAddress,
      );
    });

    test('returns TextInputType.phone for phone type', () {
      expect(
        _params(inputType: NbxInputType.phone).keyboardType,
        TextInputType.phone,
      );
    });

    test('returns TextInputType.visiblePassword for password type', () {
      expect(
        _params(inputType: NbxInputType.password).keyboardType,
        TextInputType.visiblePassword,
      );
    });

    test('returns numberWithOptions(decimal) for decimalNumber type', () {
      final keyboardType = _params(
        inputType: NbxInputType.decimalNumber,
      ).keyboardType;
      expect(
        keyboardType,
        const TextInputType.numberWithOptions(decimal: true),
      );
    });

    test('returns TextInputType.text for text type', () {
      expect(
        _params(inputType: NbxInputType.text).keyboardType,
        TextInputType.text,
      );
    });

    test('returns TextInputType.text for free type', () {
      expect(
        _params(inputType: NbxInputType.free).keyboardType,
        TextInputType.text,
      );
    });

    test('returns TextInputType.text for alphabet type', () {
      expect(
        _params(inputType: NbxInputType.alphabet).keyboardType,
        TextInputType.text,
      );
    });

    test('returns TextInputType.text for onlyText type', () {
      expect(
        _params(inputType: NbxInputType.onlyText).keyboardType,
        TextInputType.text,
      );
    });

    test('returns TextInputType.text for dropdownMenu type', () {
      expect(
        _params(inputType: NbxInputType.dropdownMenu).keyboardType,
        TextInputType.text,
      );
    });

    test('returns TextInputType.text for textAndNumbers type', () {
      expect(
        _params(inputType: NbxInputType.textAndNumbers).keyboardType,
        TextInputType.text,
      );
    });
  });

  group('NbxInputParametersExtension - buildSuffixIcon', () {
    test('returns custom suffixIcon when provided', () {
      final customIcon = const Icon(Icons.star);
      final params = _params(suffixIcon: customIcon);
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, equals(customIcon));
    });

    test('returns null when readOnly even with suffixIconType', () {
      final params = _params(
        isReadOnly: true,
        suffixIconType: NbxSuffixIconType.cancel,
      );
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, isNull);
    });

    test('returns null when disabled even with suffixIconType', () {
      final params = _params(
        isEnabled: false,
        suffixIconType: NbxSuffixIconType.cancel,
      );
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, isNull);
    });

    test('returns null for NbxSuffixIconType.none', () {
      final params = _params(suffixIconType: NbxSuffixIconType.none);
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, isNull);
    });

    test('returns cancel icon for NbxSuffixIconType.cancel', () {
      final params = _params(suffixIconType: NbxSuffixIconType.cancel);
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, isNotNull);
      expect(result, isA<GestureDetector>());
    });

    test('returns eye icon for NbxSuffixIconType.eye', () {
      final params = _params(suffixIconType: NbxSuffixIconType.eye);
      final result = params.buildSuffixIcon(obscureText: true);
      expect(result, isNotNull);
      expect(result, isA<GestureDetector>());
    });

    test('custom suffixIcon takes priority in readOnly state', () {
      final customIcon = const Icon(Icons.star);
      final params = _params(
        suffixIcon: customIcon,
        isReadOnly: true,
        suffixIconType: NbxSuffixIconType.eye,
      );
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, equals(customIcon));
    });

    test('custom suffixIcon takes priority in disabled state', () {
      final customIcon = const Icon(Icons.star);
      final params = _params(
        suffixIcon: customIcon,
        isEnabled: false,
        suffixIconType: NbxSuffixIconType.cancel,
      );
      final result = params.buildSuffixIcon(obscureText: false);
      expect(result, equals(customIcon));
    });
  });
}
