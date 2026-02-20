import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('autoDisposeController', () {
    testWidgets(
      'disposes its own controller when autoDisposeController is true (default)',
      (tester) async {
        final controller = TextEditingController(text: 'hello');

        await pumpNbxWidget(
          tester,
          NbxTextFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              labelText: 'Test',
              hintText: 'Test hint',
            ),
          ),
        );

        expect(find.byType(TextField), findsOneWidget);

        // Remove the widget from the tree to trigger dispose
        await pumpNbxWidget(tester, const SizedBox());

        // After dispose, addListener throws FlutterError
        expect(
          () => controller.addListener(() {}),
          throwsFlutterError,
        );
      },
    );

    testWidgets(
      'does NOT dispose external controller when autoDisposeController is false',
      (tester) async {
        final controller = TextEditingController(text: 'hello');

        await pumpNbxWidget(
          tester,
          NbxTextFieldWidget(
            NbxInputParameters(
              controller: controller,
              isRequired: false,
              inputType: NbxInputType.text,
              autoDisposeController: false,
              labelText: 'Test',
              hintText: 'Test hint',
            ),
          ),
        );

        expect(find.byType(TextField), findsOneWidget);

        // Remove the widget from the tree to trigger dispose
        await pumpNbxWidget(tester, const SizedBox());

        // Controller should still be usable
        expect(controller.text, 'hello');

        // Clean up manually
        controller.dispose();
      },
    );
  });
}
