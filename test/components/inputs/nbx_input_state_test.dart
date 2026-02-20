import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxInputState', () {
    test('enum has expected values', () {
      expect(NbxInputState.values, hasLength(3));
      expect(NbxInputState.values, contains(NbxInputState.neutral));
      expect(NbxInputState.values, contains(NbxInputState.success));
      expect(NbxInputState.values, contains(NbxInputState.error));
    });
  });

  group('NbxInputParameters new fields', () {
    test('defaults are backward-compatible', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Test',
        hintText: 'Hint',
      );

      expect(params.inputState, NbxInputState.neutral);
      expect(params.helperText, isNull);
      expect(params.showCharacterCounter, isFalse);
    });

    test('helperText can be set', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Test',
        hintText: 'Hint',
        helperText: 'This is helper text',
      );

      expect(params.helperText, 'This is helper text');
    });

    test('inputState can be set to success', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Test',
        hintText: 'Hint',
        inputState: NbxInputState.success,
      );

      expect(params.inputState, NbxInputState.success);
    });

    test('showCharacterCounter can be enabled', () {
      final params = NbxInputParameters(
        isRequired: false,
        inputType: NbxInputType.text,
        labelText: 'Test',
        hintText: 'Hint',
        showCharacterCounter: true,
        maxLength: 100,
      );

      expect(params.showCharacterCounter, isTrue);
      expect(params.maxLength, 100);
    });
  });

  group('NbxTextFieldWidget with new input states', () {
    testWidgets('renders helperText in decoration', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Name',
            hintText: 'Enter name',
            helperText: 'Your full name please',
          ),
        ),
      );

      expect(find.text('Your full name please'), findsOneWidget);
    });

    testWidgets('success state shows check icon', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Email',
            hintText: 'Enter email',
            inputState: NbxInputState.success,
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    });

    testWidgets('neutral state does not show check icon', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Email',
            hintText: 'Enter email',
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle_outline), findsNothing);
    });

    testWidgets('cursor uses textPrimary color', (tester) async {
      final controller = TextEditingController();

      await pumpNbxWidget(
        tester,
        NbxTextFieldWidget(
          NbxInputParameters(
            controller: controller,
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Test',
            hintText: 'Test',
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      final expectedColor = NebuxColors.standardLight().textPrimary;
      expect(textField.cursorColor, expectedColor);
    });
  });

  group('NbxTextFormFieldWidget with new input states', () {
    testWidgets('renders helperText', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Name',
            hintText: 'Enter name',
            helperText: 'Supporting text here',
          ),
        ),
      );

      expect(find.text('Supporting text here'), findsOneWidget);
    });

    testWidgets('renders with success state', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxTextFormFieldWidget(
          NbxInputParameters(
            isRequired: false,
            inputType: NbxInputType.text,
            labelText: 'Email',
            hintText: 'Enter email',
            inputState: NbxInputState.success,
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    });
  });
}
