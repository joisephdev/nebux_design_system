import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxInputDecorationExtension - inputDecoration', () {
    testWidgets('builds decoration with hintText', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'My hint',
          ),
        ),
      );

      expect(find.text('My hint'), findsOneWidget);
    });

    testWidgets('hides counter text when showCharacterCounter is false',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            maxLength: 100,
            showCharacterCounter: false,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      // counterText is empty string when showCharacterCounter is false
      expect(textField.decoration?.counterText, equals(''));
    });

    testWidgets('shows counter text when showCharacterCounter is true',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            maxLength: 100,
            showCharacterCounter: true,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      // counterText is null when showCharacterCounter is true (Flutter shows default)
      expect(textField.decoration?.counterText, isNull);
    });

    testWidgets('outlined style omits labelText from decoration',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            decorationStyle: NbxInputDecorationStyle.outlined,
            labelText: 'My Label',
            hintText: 'My Hint',
          ),
        ),
      );

      // The label appears as a Text widget above, NOT inside the decoration
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.labelText, isNull);
    });

    testWidgets('floating style includes labelText in decoration',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            decorationStyle: NbxInputDecorationStyle.floating,
            labelText: 'My Label',
            hintText: 'My Hint',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.labelText, equals('My Label'));
    });

    testWidgets('filled style uses FloatingLabelBehavior.never',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            decorationStyle: NbxInputDecorationStyle.filled,
            hintText: 'My Hint',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(
        textField.decoration?.floatingLabelBehavior,
        FloatingLabelBehavior.never,
      );
    });

    testWidgets('success inputState shows success border', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            inputState: NbxInputState.success,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      final enabledBorder =
          textField.decoration?.enabledBorder as OutlineInputBorder;
      final expectedColor = NebuxColors.standardLight().success;
      expect(enabledBorder.borderSide.color, expectedColor);
    });

    testWidgets('success inputState shows check icon suffix', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            inputState: NbxInputState.success,
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    });

    testWidgets('custom suffixIcon takes priority over success icon',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            inputState: NbxInputState.success,
            suffixIcon: const Icon(Icons.star),
          ),
        ),
      );

      // Check icon should not appear since custom suffix overrides it
      expect(find.byIcon(Icons.check_circle_outline), findsNothing);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('applies custom fillColor', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            fillColor: Colors.red,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.fillColor, Colors.red);
    });

    testWidgets('applies prefixIcon', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('applies custom enabledBorder', (tester) async {
      final customBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.purple, width: 2),
      );

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            enabledBorder: customBorder,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.enabledBorder, equals(customBorder));
    });

    testWidgets('applies custom focusedBorder', (tester) async {
      final customBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      );

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            focusedBorder: customBorder,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.decoration?.focusedBorder, equals(customBorder));
    });

    testWidgets('hides error text when showErrorText is false', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Label',
            hintText: 'Hint',
            showErrorText: false,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      // When showErrorText is false, errorStyle has fontSize ~0
      expect(textField.decoration?.errorStyle?.fontSize, closeTo(0.01, 0.01));
    });

    testWidgets('uses floatingLabelBehavior parameter', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            decorationStyle: NbxInputDecorationStyle.floating,
            labelText: 'Label',
            hintText: 'Hint',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(
        textField.decoration?.floatingLabelBehavior,
        FloatingLabelBehavior.always,
      );
    });
  });
}
