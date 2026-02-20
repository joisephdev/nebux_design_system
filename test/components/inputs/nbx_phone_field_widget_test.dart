import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

Country _testCountry() {
  return Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '2012345678',
    displayName: 'United States (US) [+1]',
    displayNameNoCountryCode: 'United States',
    e164Key: '1-US-0',
    capital: 'Washington',
    language: 'en',
    maxLength: 10,
    minLength: 10,
  );
}

void main() {
  group('NbxPhoneFieldWidget', () {
    testWidgets('renders country picker and phone number input',
        (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: null,
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      // Should render a Row with two Flexible children
      expect(find.byType(Row), findsOneWidget);
      // Should contain NbxCountryPickerInput and NbxTextFormFieldWidget
      expect(find.byType(NbxCountryPickerInput), findsOneWidget);
      // Two TextFormField widgets: one for country picker, one for phone
      expect(find.byType(TextFormField), findsNWidgets(2));

      phoneController.dispose();
    });

    testWidgets('phone input is read-only when no country selected',
        (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: null,
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      // Find the phone TextField (underlying widget) - there are multiple
      // TextFields; the phone one is the last
      final textFields = tester.widgetList<TextField>(
        find.byType(TextField),
      );
      final phoneField = textFields.last;
      expect(phoneField.readOnly, isTrue);

      phoneController.dispose();
    });

    testWidgets('shows default helper text when no country selected',
        (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: null,
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Select a country first'), findsOneWidget);

      phoneController.dispose();
    });

    testWidgets('shows custom noCountryHelperText when no country selected',
        (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: null,
            noCountryHelperText: 'Pick a country first!',
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Pick a country first!'), findsOneWidget);

      phoneController.dispose();
    });

    testWidgets('phone input is editable when country is selected',
        (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: _testCountry(),
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      // Phone field should not be readonly when country is selected
      final textFields = tester.widgetList<TextField>(
        find.byType(TextField),
      );
      final phoneField = textFields.last;
      expect(phoneField.readOnly, isFalse);

      // Helper text should not appear
      expect(find.text('Select a country first'), findsNothing);

      phoneController.dispose();
    });

    testWidgets('applies maxLength from selected country', (tester) async {
      final phoneController = TextEditingController();
      final countryController = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxPhoneFieldWidget(
            countrySelected: _testCountry(),
            countryCodeInputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: countryController,
              labelText: 'Country',
              hintText: 'Select',
            ),
            phoneNumberInputParameters: NbxInputParameters(
              controller: phoneController,
              isRequired: false,
              inputType: NbxInputType.phone,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              autoDisposeController: false,
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      final textFields = tester.widgetList<TextField>(
        find.byType(TextField),
      );
      final phoneField = textFields.last;
      expect(phoneField.maxLength, equals(10));

      phoneController.dispose();
    });
  });
}
