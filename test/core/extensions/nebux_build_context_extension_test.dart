import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NebuxBuildContextExtension', () {
    late NebuxColors colors;
    late NebuxTypography typography;
    late NebuxFontSize fontSize;

    setUp(() {
      colors = NebuxColors.standardLight();
      typography = NebuxTypography.custom('Roboto', null);
      fontSize = NebuxFontSize.standard();
    });

    Widget buildApp({required Widget Function(BuildContext) builder}) {
      return MaterialApp(
        theme: NebuxTheme.createThemeData(
          isDark: false,
          colors: colors,
          fontSize: fontSize,
          typography: typography,
        ),
        home: Scaffold(
          body: Builder(builder: (context) => builder(context)),
        ),
      );
    }

    testWidgets('nebuxTheme returns NebuxTheme from context', (tester) async {
      late NebuxTheme capturedTheme;

      await tester.pumpWidget(buildApp(
        builder: (context) {
          capturedTheme = context.nebuxTheme;
          return const SizedBox();
        },
      ));

      expect(capturedTheme, isA<NebuxTheme>());
      expect(capturedTheme.colors.primary, equals(colors.primary));
    });

    testWidgets('nebuxColors returns NebuxColors from context', (tester) async {
      late NebuxColors capturedColors;

      await tester.pumpWidget(buildApp(
        builder: (context) {
          capturedColors = context.nebuxColors;
          return const SizedBox();
        },
      ));

      expect(capturedColors, isA<NebuxColors>());
      expect(capturedColors.primary, equals(colors.primary));
      expect(capturedColors.secondary, equals(colors.secondary));
    });

    testWidgets('nebuxTypography returns NebuxTypography from context',
        (tester) async {
      late NebuxTypography capturedTypography;

      await tester.pumpWidget(buildApp(
        builder: (context) {
          capturedTypography = context.nebuxTypography;
          return const SizedBox();
        },
      ));

      expect(capturedTypography, isA<NebuxTypography>());
      expect(capturedTypography.heading.fontFamily, equals('Roboto'));
    });
  });
}
