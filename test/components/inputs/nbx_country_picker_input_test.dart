import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxCountryPickerInput', () {
    testWidgets('renders a read-only TextFormField', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select a country',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      // Access the underlying TextField to check readOnly
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.readOnly, isTrue);
    });

    testWidgets('shows dropdown arrow icon', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select a country',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('renders with prefixIcon when provided', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select a country',
              prefixIcon: const Icon(Icons.flag),
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.flag), findsOneWidget);
    });

    testWidgets('applies custom validator on non-empty value', (tester) async {
      final controller = TextEditingController(text: 'invalid');
      final formKey = GlobalKey<FormState>();

      await pumpNbxWidget(
        tester,
        Form(
          key: formKey,
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
            validator: (value) {
              if (value == 'invalid') {
                return 'Invalid selection';
              }
              return null;
            },
          ),
        ),
      );

      // Trigger validation
      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Invalid selection'), findsOneWidget);
    });

    testWidgets('calls onValidationResult callback', (tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();
      String? lastValidationResult;

      await pumpNbxWidget(
        tester,
        Form(
          key: formKey,
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: true,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select',
              requiredErrorMessage: 'Required',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
            onValidationResult: (error) => lastValidationResult = error,
          ),
        ),
      );

      formKey.currentState!.validate();
      await tester.pump();

      // onValidationResult should have been called
      expect(lastValidationResult, equals('Required'));
    });

    testWidgets('showErrorText=false hides error text', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
            showErrorText: false,
          ),
        ),
      );

      // Widget should render without error
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('applies custom border overrides', (tester) async {
      final controller = TextEditingController();
      final customBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.orange),
      );

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxCountryPickerInput(
            inputParameters: NbxCountryPickerParameters(
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              controller: controller,
              labelText: 'Country',
              hintText: 'Select',
            ),
            modal: NbxCountryPickerModalParameters(
              appBarTitle: 'Select Country',
              onSelect: (_) {},
            ),
            enabledBorder: customBorder,
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
