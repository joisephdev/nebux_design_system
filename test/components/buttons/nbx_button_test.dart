import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxButton', () {
    group('variants', () {
      testWidgets('filled variant renders FilledButton', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Test Button',
            onPressed: () {},
            styleConfig: const ButtonStyleConfig(variant: ButtonVariant.filled),
          ),
        );

        expect(find.byType(FilledButton), findsOneWidget);
        expect(find.text('Test Button'), findsOneWidget);
      });

      testWidgets('outline variant renders OutlinedButton', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Test Button',
            onPressed: () {},
            styleConfig: const ButtonStyleConfig(
              variant: ButtonVariant.outline,
            ),
          ),
        );

        expect(find.byType(OutlinedButton), findsOneWidget);
        expect(find.text('Test Button'), findsOneWidget);
      });

      testWidgets('text variant renders TextButton', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Test Button',
            onPressed: () {},
            styleConfig: const ButtonStyleConfig(variant: ButtonVariant.text),
          ),
        );

        expect(find.byType(TextButton), findsOneWidget);
        expect(find.text('Test Button'), findsOneWidget);
      });

      testWidgets('danger variant renders FilledButton', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Danger Button',
            onPressed: () {},
            styleConfig: const ButtonStyleConfig(variant: ButtonVariant.danger),
          ),
        );

        expect(find.byType(FilledButton), findsOneWidget);
        expect(find.text('Danger Button'), findsOneWidget);
      });
    });

    group('onPressed callback', () {
      testWidgets('fires when tapped', (tester) async {
        var pressed = false;
        await pumpNbxWidget(
          tester,
          NbxButton(text: 'Press Me', onPressed: () => pressed = true),
        );

        await tester.tap(find.text('Press Me'));
        await tester.pump();

        expect(pressed, isTrue);
      });
    });

    group('loading state', () {
      testWidgets('shows CircularProgressIndicator when loading', (
        tester,
      ) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Loading Button',
            onPressed: () {},
            stateConfig: const ButtonStateConfig(isLoading: true),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Loading Button'), findsNothing);
      });

      testWidgets('does not fire onPressed when loading', (tester) async {
        var pressed = false;
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Loading Button',
            onPressed: () => pressed = true,
            stateConfig: const ButtonStateConfig(isLoading: true),
          ),
        );

        await tester.tap(find.byType(FilledButton));
        await tester.pump();

        expect(pressed, isFalse);
      });
    });

    group('disabled state', () {
      testWidgets('does not fire onPressed when disabled', (tester) async {
        var pressed = false;
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Disabled Button',
            onPressed: () => pressed = true,
            stateConfig: const ButtonStateConfig(enabled: false),
          ),
        );

        await tester.tap(find.byType(FilledButton));
        await tester.pump();

        expect(pressed, isFalse);
      });
    });

    group('layout', () {
      testWidgets('expands when isExpanded is true', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Expanded Button',
            onPressed: () {},
            layoutConfig: const ButtonLayoutConfig(isExpanded: true),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.width, equals(double.infinity));
      });

      testWidgets('does not wrap in SizedBox when isExpanded is false', (
        tester,
      ) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'Normal Button',
            onPressed: () {},
            layoutConfig: const ButtonLayoutConfig(isExpanded: false),
          ),
        );

        expect(find.byType(SizedBox), findsNothing);
      });
    });

    group('icons', () {
      testWidgets('renders leading icon', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'With Icon',
            onPressed: () {},
            iconConfig: const ButtonIconConfig(icon: Icons.add),
          ),
        );

        expect(find.byIcon(Icons.add), findsOneWidget);
      });

      testWidgets('renders trailing icon', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(
            text: 'With Trailing',
            onPressed: () {},
            iconConfig: const ButtonIconConfig(
              trailingIcon: Icons.arrow_forward,
            ),
          ),
        );

        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      });

      testWidgets('no icon when not configured', (tester) async {
        await pumpNbxWidget(
          tester,
          NbxButton(text: 'No Icon', onPressed: () {}),
        );

        expect(find.byType(Icon), findsNothing);
      });
    });
  });
}
