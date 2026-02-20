import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxTextFormFieldWidget D21 fix - textPrimary color', () {
    testWidgets('text style uses textPrimary from theme', (tester) async {
      final controller = TextEditingController(text: 'hello');

      await pumpNbxWidget(
        tester,
        Form(
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
      );

      // Access the underlying TextField to check style
      final textField = tester.widget<TextField>(find.byType(TextField));

      final expectedColor = NebuxColors.standardLight().textPrimary;
      expect(textField.style?.color, expectedColor);
    });

    testWidgets('text style does NOT use black (pre-D21 regression check)',
        (tester) async {
      final controller = TextEditingController(text: 'hello');

      await pumpNbxWidget(
        tester,
        Form(
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
      );

      final textField = tester.widget<TextField>(find.byType(TextField));

      // Text color must NOT be plain black
      expect(textField.style?.color, isNot(equals(Colors.black)));
    });

    testWidgets('cursor color uses textPrimary from theme', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
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
      );

      final textField = tester.widget<TextField>(find.byType(TextField));

      final expectedColor = NebuxColors.standardLight().textPrimary;
      expect(textField.cursorColor, expectedColor);
    });
  });

  group('NbxTextFormFieldWidget - outlined decoration style', () {
    testWidgets('renders Column with label when outlined', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.outlined,
              labelText: 'My Label',
              hintText: 'My Hint',
            ),
          ),
        ),
      );

      // Label text should appear as a separate Text widget above the input
      expect(find.text('My Label'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('floating style does not wrap in Column', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              decorationStyle: NbxInputDecorationStyle.floating,
              labelText: 'My Label',
              hintText: 'My Hint',
            ),
          ),
        ),
      );

      // Should render TextFormField directly (inside NbxTextFieldWithStateWidget)
      expect(find.byType(TextFormField), findsOneWidget);
    });
  });

  group('NbxTextFormFieldWidget - textFormAlign', () {
    testWidgets('defaults to TextAlign.start', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              labelText: 'Test',
              hintText: 'Hint',
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.textAlign, TextAlign.start);
    });

    testWidgets('applies custom textFormAlign', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              labelText: 'Test',
              hintText: 'Hint',
            ),
            textFormAlign: TextAlign.center,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.textAlign, TextAlign.center);
    });
  });

  group('NbxTextFormFieldWidget - readOnly disables interactive selection',
      () {
    testWidgets('readOnly field disables interactive selection',
        (tester) async {
      final controller = TextEditingController(text: 'readonly text');

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              isReadOnly: true,
              labelText: 'Test',
              hintText: 'Hint',
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.readOnly, isTrue);
      expect(textField.enableInteractiveSelection, isFalse);
    });
  });

  group('NbxTextFormFieldWidget - onTap callback', () {
    testWidgets('onTap fires when tapped', (tester) async {
      bool tapped = false;
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        Form(
          child: NbxTextFormFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              labelText: 'Test',
              hintText: 'Hint',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextFormField));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
