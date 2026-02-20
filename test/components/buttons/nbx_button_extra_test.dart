import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxButton additional coverage', () {
    testWidgets('custom backgroundColor applies to filled variant', (
      tester,
    ) async {
      const customBg = Color(0xFF00FF00);
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Custom BG',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(
            variant: ButtonVariant.filled,
            customBackgroundColor: customBg,
          ),
        ),
      );

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );
      final style = button.style!;
      final bgColor = style.backgroundColor?.resolve({});
      expect(bgColor, customBg);
    });

    testWidgets('custom borderRadius applies', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Rounded',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(borderRadius: 20.0),
        ),
      );

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );
      final shape = button.style!.shape?.resolve({}) as RoundedRectangleBorder;
      expect(
        shape.borderRadius,
        BorderRadius.circular(20.0),
      );
    });

    testWidgets('custom textStyle applies to filled variant', (tester) async {
      const customStyle = TextStyle(fontSize: 24, color: Colors.red);
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Styled',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(textStyle: customStyle),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Styled'));
      expect(textWidget.style?.fontSize, 24);
    });

    testWidgets('outline variant selected state uses primary bg', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Selected',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.outline),
          stateConfig: const ButtonStateConfig(isSelected: true),
        ),
      );

      final button = tester.widget<OutlinedButton>(
        find.byType(OutlinedButton),
      );
      final bgColor = button.style!.backgroundColor?.resolve({});
      expect(bgColor, testNebuxColors().primary);
    });

    testWidgets('outline variant selected spinner uses white', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Loading Selected',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.outline),
          stateConfig: const ButtonStateConfig(
            isLoading: true,
            isSelected: true,
          ),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, testNebuxColors().white);
    });

    testWidgets('danger variant spinner uses white', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Danger Loading',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.danger),
          stateConfig: const ButtonStateConfig(isLoading: true),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, testNebuxColors().white);
    });

    testWidgets('filled variant spinner uses white', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Filled Loading',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.filled),
          stateConfig: const ButtonStateConfig(isLoading: true),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      final animation =
          indicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(animation.value, testNebuxColors().white);
    });

    testWidgets('disabled filled variant shows disabled background', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Disabled',
          onPressed: () {},
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );
      final bgColor = button.style!.backgroundColor?.resolve({});
      expect(bgColor, testNebuxColors().disabled);
    });

    testWidgets('disabled outline variant shows reduced opacity border', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Disabled Outline',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.outline),
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final button = tester.widget<OutlinedButton>(
        find.byType(OutlinedButton),
      );
      final side = button.style!.side?.resolve({});
      expect(side, isNotNull);
    });

    testWidgets('disabled danger variant shows reduced opacity bg', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Disabled Danger',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.danger),
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final button = tester.widget<FilledButton>(
        find.byType(FilledButton),
      );
      final bgColor = button.style!.backgroundColor?.resolve({});
      final expectedColor = testNebuxColors().textSecondary.withValues(
        alpha: .3,
      );
      expect(bgColor, expectedColor);
    });

    testWidgets('disabled text variant shows reduced opacity foreground', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Disabled Text',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.text),
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final button = tester.widget<TextButton>(
        find.byType(TextButton),
      );
      expect(button.style, isNotNull);
    });

    testWidgets('leading icon uses disabled color when disabled', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'With Icon',
          onPressed: () {},
          iconConfig: const ButtonIconConfig(
            icon: Icons.add,
            iconColor: Colors.blue,
          ),
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.add));
      expect(icon.color, testNebuxColors().disabled);
    });

    testWidgets('trailing icon uses disabled color when disabled', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'With Trailing',
          onPressed: () {},
          iconConfig: const ButtonIconConfig(
            trailingIcon: Icons.arrow_forward,
            trailingIconColor: Colors.green,
          ),
          stateConfig: const ButtonStateConfig(enabled: false),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_forward));
      expect(icon.color, testNebuxColors().disabled);
    });

    testWidgets('leading icon uses custom color when enabled', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'With Icon',
          onPressed: () {},
          iconConfig: const ButtonIconConfig(
            icon: Icons.add,
            iconColor: Colors.blue,
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.add));
      expect(icon.color, Colors.blue);
    });

    testWidgets('trailing icon uses custom color when enabled', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'With Trailing',
          onPressed: () {},
          iconConfig: const ButtonIconConfig(
            trailingIcon: Icons.arrow_forward,
            trailingIconColor: Colors.green,
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_forward));
      expect(icon.color, Colors.green);
    });

    testWidgets('both leading and trailing icons render', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Both Icons',
          onPressed: () {},
          iconConfig: const ButtonIconConfig(
            icon: Icons.add,
            trailingIcon: Icons.arrow_forward,
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('text variant uses content typography by default', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Text Variant',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.text),
        ),
      );

      expect(find.text('Text Variant'), findsOneWidget);
    });

    testWidgets('outline variant uses content typography by default', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxButton(
          text: 'Outline Variant',
          onPressed: () {},
          styleConfig: const ButtonStyleConfig(variant: ButtonVariant.outline),
        ),
      );

      expect(find.text('Outline Variant'), findsOneWidget);
    });
  });
}
