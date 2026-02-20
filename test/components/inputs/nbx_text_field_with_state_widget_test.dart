import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxTextFieldWithStateWidget - password toggle', () {
    testWidgets('eye icon toggles obscureText on tap', (tester) async {
      final controller = TextEditingController(text: 'secret');

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.password,
            obscureText: true,
            suffixIconType: NbxSuffixIconType.eye,
            autoDisposeController: false,
            labelText: 'Password',
            hintText: 'Enter password',
          ),
        ),
      );

      // Initially obscured
      var textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
      // Should show visibility icon (since obscured)
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap the eye icon to toggle
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Now should be un-obscured
      textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isFalse);
      // Icon should now be visibility_off
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Tap again to re-obscure
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);

      controller.dispose();
    });

    testWidgets('cancel icon clears controller text', (tester) async {
      final controller = TextEditingController(text: 'some text');

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            suffixIconType: NbxSuffixIconType.cancel,
            autoDisposeController: false,
            labelText: 'Search',
            hintText: 'Search...',
          ),
        ),
      );

      expect(controller.text, 'some text');

      // Find and tap the cancel icon
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pump();

      expect(controller.text, isEmpty);

      controller.dispose();
    });

    testWidgets('no suffix icon shows when type is none', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            suffixIconType: NbxSuffixIconType.none,
            autoDisposeController: false,
            labelText: 'Test',
            hintText: 'Hint',
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
      expect(find.byIcon(Icons.cancel), findsNothing);

      controller.dispose();
    });

    testWidgets('eye icon does not appear when readOnly', (tester) async {
      final controller = TextEditingController(text: 'secret');

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.password,
            obscureText: true,
            isReadOnly: true,
            suffixIconType: NbxSuffixIconType.eye,
            autoDisposeController: false,
            labelText: 'Password',
            hintText: 'Password',
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      controller.dispose();
    });

    testWidgets('cancel icon does not appear when disabled', (tester) async {
      final controller = TextEditingController(text: 'text');

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            isEnabled: false,
            suffixIconType: NbxSuffixIconType.cancel,
            autoDisposeController: false,
            labelText: 'Disabled',
            hintText: 'Disabled',
          ),
        ),
      );

      expect(find.byIcon(Icons.cancel), findsNothing);

      controller.dispose();
    });
  });

  group('NbxTextFieldWithStateWidget - enabled/disabled', () {
    testWidgets('enabled parameter passed through to TextField',
        (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            isEnabled: false,
            autoDisposeController: false,
            labelText: 'Test',
            hintText: 'Hint',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);

      controller.dispose();
    });
  });

  group('NbxTextFieldWithStateWidget - maxLength', () {
    testWidgets('maxLength parameter passed through to TextField',
        (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            maxLength: 20,
            autoDisposeController: false,
            labelText: 'Test',
            hintText: 'Hint',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLength, equals(20));

      controller.dispose();
    });
  });

  group('NbxTextFieldWithStateWidget - minLines', () {
    testWidgets('minLines parameter passed through to TextField',
        (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            minLines: 3,
            maxLines: 5,
            autoDisposeController: false,
            labelText: 'Test',
            hintText: 'Hint',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.minLines, equals(3));
      expect(textField.maxLines, equals(5));

      controller.dispose();
    });
  });
}
