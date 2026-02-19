import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

NebuxColors testNebuxColors() {
  return const NebuxColors(
    primary: Color(0xFF2196F3),
    secondary: Color(0xFF03A9F4),
    secondaryVariant: Color(0xFF0288D1),
    background: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF212121),
    textSecondary: Color(0xFF757575),
    actionPrimary: Color(0xFF2196F3),
    actionSecondary: Color(0xFF03A9F4),
    cardColor: Color(0xFFF5F5F5),
    success: Color(0xFF4CAF50),
    warning: Color(0xFFFFC107),
    error: Color(0xFFF44336),
    info: Color(0xFF2196F3),
    disabled: Color(0xFFBDBDBD),
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    primaryGradient: LinearGradient(
      colors: [Color(0xFF2196F3), Color(0xFF03A9F4)],
    ),
    secondaryGradient: LinearGradient(
      colors: [Color(0xFF03A9F4), Color(0xFF00BCD4)],
    ),
  );
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
