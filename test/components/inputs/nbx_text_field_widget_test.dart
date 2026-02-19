import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxTextFieldWidget', () {
    testWidgets('renders TextField widget', (tester) async {
      final controller = TextEditingController(text: 'test');

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
              child: Builder(
                builder: (context) {
                  return NbxTextFieldWidget(
                    NbxInputParameters(
                      context: context,
                      controller: controller,
                      isRequired: false,
                      inputType: NbxInputType.text,
                      labelText: 'Test Label',
                      hintText: 'Test Hint',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('test'), findsOneWidget);
    });

    testWidgets('applies obscureText for password type', (tester) async {
      final controller = TextEditingController(text: 'password123');

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
              child: Builder(
                builder: (context) {
                  return NbxTextFieldWidget(
                    NbxInputParameters(
                      context: context,
                      controller: controller,
                      isRequired: false,
                      inputType: NbxInputType.password,
                      obscureText: true,
                      labelText: 'Password',
                      hintText: 'Enter password',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });

    testWidgets('onChanged callback fires', (tester) async {
      String? changedValue;
      final controller = TextEditingController();

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
              child: Builder(
                builder: (context) {
                  return NbxTextFieldWidget(
                    NbxInputParameters(
                      context: context,
                      controller: controller,
                      isRequired: false,
                      inputType: NbxInputType.text,
                      onChanged: (value) => changedValue = value,
                      labelText: 'Test',
                      hintText: 'Enter text',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'new value');
      expect(changedValue, equals('new value'));
    });

    testWidgets('applies readOnly parameter', (tester) async {
      final controller = TextEditingController(text: 'readonly');

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
              child: Builder(
                builder: (context) {
                  return NbxTextFieldWidget(
                    NbxInputParameters(
                      context: context,
                      controller: controller,
                      isRequired: false,
                      inputType: NbxInputType.text,
                      isReadOnly: true,
                      labelText: 'Test',
                      hintText: 'Readonly field',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.readOnly, isTrue);
    });

    testWidgets('applies maxLines parameter', (tester) async {
      final controller = TextEditingController();

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
              child: Builder(
                builder: (context) {
                  return NbxTextFieldWidget(
                    NbxInputParameters(
                      context: context,
                      controller: controller,
                      isRequired: false,
                      inputType: NbxInputType.text,
                      maxLines: 5,
                      labelText: 'Test',
                      hintText: 'Multiline',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLines, equals(5));
    });
  });
}
