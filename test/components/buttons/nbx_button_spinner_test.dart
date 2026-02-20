import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxButton spinner color', () {
    testWidgets('filled variant shows spinner when loading', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Submit',
          onPressed: () {},
          stateConfig: const ButtonStateConfig(isLoading: true),
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.filled),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('custom loadingColor is applied', (tester) async {
      const customColor = Color(0xFFFF0000);

      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Submit',
          onPressed: () {},
          stateConfig: const ButtonStateConfig(
            isLoading: true,
            loadingColor: customColor,
          ),
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.filled),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, customColor);
    });

    testWidgets('outline variant uses actionPrimary for spinner',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Outline',
          onPressed: () {},
          stateConfig: const ButtonStateConfig(isLoading: true),
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.outline),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, NebuxColors.standardLight().actionPrimary);
    });

    testWidgets('text variant uses actionPrimary for spinner',
        (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Text',
          onPressed: () {},
          stateConfig: const ButtonStateConfig(isLoading: true),
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.text),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, NebuxColors.standardLight().actionPrimary);
    });
  });

  group('ButtonStateConfig', () {
    test('loadingColor defaults to null', () {
      const config = ButtonStateConfig();
      expect(config.loadingColor, isNull);
    });

    test('copyWith preserves loadingColor', () {
      const config = ButtonStateConfig(loadingColor: Color(0xFFFF0000));
      final copied = config.copyWith(isLoading: true);
      expect(copied.loadingColor, const Color(0xFFFF0000));
      expect(copied.isLoading, isTrue);
    });

    test('equality includes loadingColor', () {
      const a = ButtonStateConfig(loadingColor: Color(0xFFFF0000));
      const b = ButtonStateConfig(loadingColor: Color(0xFFFF0000));
      const c = ButtonStateConfig(loadingColor: Color(0xFF00FF00));
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });
  });
}
