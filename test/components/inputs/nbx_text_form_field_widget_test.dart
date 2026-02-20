import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxTextFormFieldWidget', () {
    testWidgets('renders TextFormField widget', (tester) async {
      final controller = TextEditingController(text: 'test');
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Theme(
              data: NebuxTheme.createThemeData(
                isDark: false,
                colors: testNebuxColors(),
                fontSize: NebuxFontSize.standard(),
                typography: NebuxTypography.custom('Roboto', null),
              ),
              child: Form(
                key: formKey,
                child: NbxTextFormFieldWidget(
                  NbxInputParameters(
                    controller: controller,
                    isRequired: false,
                    inputType: NbxInputType.text,
                    labelText: 'Test Label',
                    hintText: 'Test Hint',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('test'), findsOneWidget);
    });

    testWidgets('validator callback integrates with Form', (tester) async {
      final controller = TextEditingController(text: 'initial value');
      final formKey = GlobalKey<FormState>();
      String? validationResult;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Theme(
              data: NebuxTheme.createThemeData(
                isDark: false,
                colors: testNebuxColors(),
                fontSize: NebuxFontSize.standard(),
                typography: NebuxTypography.custom('Roboto', null),
              ),
              child: Form(
                key: formKey,
                child: NbxTextFormFieldWidget(
                  NbxInputParameters(
                    controller: controller,
                    isRequired: true,
                    inputType: NbxInputType.text,
                    requiredErrorMessage: 'Field is required',
                    labelText: 'Test',
                    hintText: 'Enter value',
                    validator: (value) {
                      validationResult = value;
                      return null;
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(formKey.currentState!.validate(), isTrue);
      expect(validationResult, equals('initial value'));
    });

    testWidgets('autovalidateMode works correctly', (tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Theme(
              data: NebuxTheme.createThemeData(
                isDark: false,
                colors: testNebuxColors(),
                fontSize: NebuxFontSize.standard(),
                typography: NebuxTypography.custom('Roboto', null),
              ),
              child: Form(
                key: formKey,
                child: NbxTextFormFieldWidget(
                  NbxInputParameters(
                    controller: controller,
                    isRequired: true,
                    inputType: NbxInputType.text,
                    requiredErrorMessage: 'Field is required',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    labelText: 'Test',
                    hintText: 'Enter value',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(
        formField.autovalidateMode,
        equals(AutovalidateMode.onUserInteraction),
      );
    });

    testWidgets('Form.validate() triggers field validation', (tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();
      bool validationTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Theme(
              data: NebuxTheme.createThemeData(
                isDark: false,
                colors: testNebuxColors(),
                fontSize: NebuxFontSize.standard(),
                typography: NebuxTypography.custom('Roboto', null),
              ),
              child: Form(
                key: formKey,
                child: NbxTextFormFieldWidget(
                  NbxInputParameters(
                    controller: controller,
                    isRequired: true,
                    inputType: NbxInputType.text,
                    requiredErrorMessage: 'Field is required',
                    labelText: 'Test',
                    hintText: 'Enter value',
                    onValidationResult: (error) {
                      validationTriggered = true;
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      formKey.currentState!.validate();
      await tester.pump();

      expect(validationTriggered, isTrue);
    });

    testWidgets('applies obscureText for password type', (tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Theme(
              data: NebuxTheme.createThemeData(
                isDark: false,
                colors: testNebuxColors(),
                fontSize: NebuxFontSize.standard(),
                typography: NebuxTypography.custom('Roboto', null),
              ),
              child: Form(
                key: formKey,
                child: NbxTextFormFieldWidget(
                  NbxInputParameters(
                    controller: controller,
                    isRequired: false,
                    inputType: NbxInputType.password,
                    obscureText: true,
                    labelText: 'Password',
                    hintText: 'Enter password',
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
