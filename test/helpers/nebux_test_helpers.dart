import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

NebuxColors testNebuxColors() {
  return NebuxColors.standardLight();
}

NebuxTheme testNebuxTheme() {
  return NebuxTheme.custom(
    colors: testNebuxColors(),
    fontSize: NebuxFontSize.standard(),
    typography: NebuxTypography.custom('Roboto', null),
  );
}

Widget testMaterialApp({required Widget child}) {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return Theme(
            data: NebuxTheme.createThemeData(
              isDark: false,
              colors: testNebuxColors(),
              fontSize: NebuxFontSize.standard(),
              typography: NebuxTypography.custom('Roboto', null),
            ),
            child: child,
          );
        },
      ),
    ),
  );
}

Future<void> pumpNbxWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(testMaterialApp(child: widget));
}
