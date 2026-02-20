import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NbxInputParameters', () {
    test('defaults are correct', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Label',
        hintText: 'Hint',
      );

      expect(params.obscureText, isFalse);
      expect(params.isReadOnly, isFalse);
      expect(params.isEnabled, isTrue);
      expect(params.autoDisposeController, isTrue);
      expect(params.showErrorText, isTrue);
      expect(params.autovalidateMode, AutovalidateMode.onUserInteraction);
      expect(params.decorationStyle, NbxInputDecorationStyle.outlined);
      expect(params.suffixIconType, NbxSuffixIconType.none);
      expect(params.inputState, NbxInputState.neutral);
      expect(params.showCharacterCounter, isFalse);
      expect(params.controller, isNull);
      expect(params.maxLines, isNull);
      expect(params.minLines, isNull);
      expect(params.maxLength, isNull);
      expect(params.suffixIcon, isNull);
      expect(params.prefixIcon, isNull);
      expect(params.fillColor, isNull);
      expect(params.textInputAction, isNull);
      expect(params.requiredErrorMessage, isNull);
      expect(params.validator, isNull);
      expect(params.onValidationResult, isNull);
      expect(params.helperText, isNull);
      expect(params.onTap, isNull);
    });

    test('copyWith creates a copy with modified fields', () {
      final original = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Label',
        hintText: 'Hint',
      );

      final copy = original.copyWith(
        isReadOnly: true,
        maxLength: 50,
        helperText: 'Helper',
      );

      expect(copy.isReadOnly, isTrue);
      expect(copy.maxLength, equals(50));
      expect(copy.helperText, equals('Helper'));
      // Unchanged fields remain the same
      expect(copy.isRequired, isFalse);
      expect(copy.inputType, NbxInputType.text);
      expect(copy.labelText, equals('Label'));
    });

    test('copyWith preserves controller', () {
      final controller = TextEditingController(text: 'hello');
      final original = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Label',
        hintText: 'Hint',
        controller: controller,
      );

      final copy = original.copyWith(maxLength: 10);

      expect(copy.controller, equals(controller));
      expect(copy.controller?.text, equals('hello'));

      controller.dispose();
    });

    test('required field must have requiredErrorMessage', () {
      expect(
        () => NbxInputParameters(
          isRequired: true,
          inputType: NbxInputType.text,
          labelText: 'Label',
          hintText: 'Hint',
          // missing requiredErrorMessage
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('required field with error message does not throw', () {
      final params = NbxInputParameters(
        isRequired: true,
        inputType: NbxInputType.text,
        labelText: 'Label',
        hintText: 'Hint',
        requiredErrorMessage: 'This field is required',
      );

      expect(params.isRequired, isTrue);
      expect(params.requiredErrorMessage, 'This field is required');
    });

    test('must have either labelText or hintText', () {
      expect(
        () => NbxInputParameters(
          isRequired: false,
          inputType: NbxInputType.text,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('outlined style requires both labelText and hintText', () {
      expect(
        () => NbxInputParameters(
          isRequired: false,
          inputType: NbxInputType.text,
          decorationStyle: NbxInputDecorationStyle.outlined,
          labelText: 'Label',
          // missing hintText
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('outlined style with both labelText and hintText works', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        decorationStyle: NbxInputDecorationStyle.outlined,
        labelText: 'Label',
        hintText: 'Hint',
      );

      expect(params.decorationStyle, NbxInputDecorationStyle.outlined);
      expect(params.labelText, 'Label');
      expect(params.hintText, 'Hint');
    });

    test('floating style with only hintText works', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        decorationStyle: NbxInputDecorationStyle.floating,
        hintText: 'Hint only',
      );

      expect(params.hintText, 'Hint only');
      expect(params.labelText, isNull);
    });
  });

  group('NbxCountryPickerParameters', () {
    test('defaults are correct', () {
      final controller = TextEditingController();
      final params = NbxCountryPickerParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        decorationStyle: NbxInputDecorationStyle.outlined,
        controller: controller,
        labelText: 'Country',
        hintText: 'Select',
      );

      expect(params.maxLines, isNull);
      expect(params.prefixIcon, isNull);
      expect(params.requiredErrorMessage, isNull);

      controller.dispose();
    });

    test('required field must have requiredErrorMessage', () {
      final controller = TextEditingController();
      expect(
        () => NbxCountryPickerParameters(
          isRequired: true,
          inputType: NbxInputType.text,
          decorationStyle: NbxInputDecorationStyle.outlined,
          controller: controller,
          // missing requiredErrorMessage
        ),
        throwsA(isA<AssertionError>()),
      );

      controller.dispose();
    });

    test('required field with error message does not throw', () {
      final controller = TextEditingController();
      final params = NbxCountryPickerParameters(
        isRequired: true,
        inputType: NbxInputType.text,
        decorationStyle: NbxInputDecorationStyle.outlined,
        controller: controller,
        requiredErrorMessage: 'Please select a country',
      );

      expect(params.isRequired, isTrue);
      expect(params.requiredErrorMessage, 'Please select a country');

      controller.dispose();
    });
  });

  group('NbxCountryPickerModalParameters', () {
    test('defaults are correct', () {
      final modal = NbxCountryPickerModalParameters(
        appBarTitle: 'Countries',
        onSelect: (_) {},
      );

      expect(modal.appBarTitle, 'Countries');
      expect(modal.backgroundColour, Colors.white);
      expect(modal.appBarTextColour, Colors.white);
      expect(modal.backIconColour, Colors.white);
      expect(modal.dividerColour, Colors.black12);
      expect(modal.searchBarBackgroundColor, Colors.white);
      expect(modal.searchBarOuterBackgroundColor, Colors.white);
      expect(modal.appBarFontStyle, FontStyle.normal);
      expect(modal.countryFontStyle, FontStyle.normal);
      expect(modal.appBarFontSize, 20);
      expect(modal.countryTitleSize, 16);
      expect(modal.searchBarBorderWidth, 0.5);
      expect(modal.appBarTextCenterAlign, isTrue);
      expect(modal.searchBarAutofocus, isFalse);
      expect(modal.showSearchBox, isTrue);
      expect(modal.showPhoneCode, isFalse);
      expect(modal.appBarFontWeight, FontWeight.bold);
      expect(modal.countryFontWeight, FontWeight.bold);
      expect(modal.backIcon, Icons.arrow_back);
      expect(modal.searchBarIcon, Icons.search);
      expect(modal.countries, isNull);
    });

    test('copyWith modifies fields correctly', () {
      final modal = NbxCountryPickerModalParameters(
        appBarTitle: 'Countries',
        onSelect: (_) {},
      );

      final modified = modal.copyWith(
        showPhoneCode: true,
        searchBarAutofocus: true,
      );

      expect(modified.showPhoneCode, isTrue);
      expect(modified.searchBarAutofocus, isTrue);
      expect(modified.appBarTitle, 'Countries');
    });
  });
}
