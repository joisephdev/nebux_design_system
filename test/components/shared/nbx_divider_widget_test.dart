import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxDividerWidget', () {
    testWidgets('uses divider semantic token by default', (tester) async {
      await pumpNbxWidget(tester, const NbxDividerWidget());

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, NebuxColors.standardLight().divider);
    });

    testWidgets('custom color overrides default', (tester) async {
      const customColor = Color(0xFFFF0000);

      await pumpNbxWidget(
        tester,
        const NbxDividerWidget(color: customColor),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, customColor);
    });

    testWidgets('applies custom height', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxDividerWidget(height: 20),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.height, 20);
    });
  });
}
