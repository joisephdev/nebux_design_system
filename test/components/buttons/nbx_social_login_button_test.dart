import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxSocialLoginButton', () {
    testWidgets('renders icon and text', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Continue with Google',
          icon: const Icon(Icons.g_mobiledata),
          onPressed: () {},
        ),
      );

      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
    });

    testWidgets('fires onPressed when tapped', (tester) async {
      var pressed = false;
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Sign in',
          icon: const Icon(Icons.apple),
          onPressed: () => pressed = true,
        ),
      );

      await tester.tap(find.text('Sign in'));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('renders as full width', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Login',
          icon: const Icon(Icons.facebook),
          onPressed: () {},
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, double.infinity);
      expect(sizedBox.height, 56);
    });

    testWidgets('renders ElevatedButton', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Login',
          icon: const Icon(Icons.login),
          onPressed: () {},
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('applies custom backgroundColor', (tester) async {
      const customBg = Color(0xFF4285F4);
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Google',
          icon: const Icon(Icons.g_mobiledata),
          onPressed: () {},
          backgroundColor: customBg,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final bgColor = style.backgroundColor?.resolve({});
      expect(bgColor, customBg);
    });

    testWidgets('applies custom textColor', (tester) async {
      const customText = Color(0xFFFF0000);
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Apple',
          icon: const Icon(Icons.apple),
          onPressed: () {},
          textColor: customText,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final fgColor = style.foregroundColor?.resolve({});
      expect(fgColor, customText);
    });

    testWidgets('outlined style uses transparent background', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Outlined',
          icon: const Icon(Icons.login),
          onPressed: () {},
          isOutlined: true,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final bgColor = style.backgroundColor?.resolve({});
      expect(bgColor, Colors.transparent);
    });

    testWidgets('outlined style applies border', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Outlined',
          icon: const Icon(Icons.login),
          onPressed: () {},
          isOutlined: true,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final side = style.side?.resolve({});
      expect(side, isNotNull);
      expect(side!.width, 1.5);
    });

    testWidgets('outlined style applies custom borderColor', (tester) async {
      const customBorder = Color(0xFF00FF00);
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Outlined',
          icon: const Icon(Icons.login),
          onPressed: () {},
          isOutlined: true,
          borderColor: customBorder,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final side = style.side?.resolve({});
      expect(side, isNotNull);
      expect(side!.color, customBorder);
    });

    testWidgets('non-outlined does not set side', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxSocialLoginButton(
          text: 'Filled',
          icon: const Icon(Icons.login),
          onPressed: () {},
          isOutlined: false,
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = button.style!;
      final side = style.side?.resolve({});
      expect(side, isNull);
    });

    testWidgets('onPressed null renders disabled button', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxSocialLoginButton(
          text: 'Disabled',
          icon: Icon(Icons.login),
        ),
      );

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(button.onPressed, isNull);
    });
  });

  group('ButtonStyleConfig', () {
    test('defaults to filled variant', () {
      const config = ButtonStyleConfig();
      expect(config.variant, ButtonVariant.filled);
      expect(config.customBackgroundColor, isNull);
      expect(config.borderRadius, isNull);
      expect(config.textStyle, isNull);
    });

    test('copyWith replaces values', () {
      const config = ButtonStyleConfig(variant: ButtonVariant.filled);
      final copied = config.copyWith(variant: ButtonVariant.outline);
      expect(copied.variant, ButtonVariant.outline);
    });

    test('copyWith preserves unset values', () {
      const config = ButtonStyleConfig(
        variant: ButtonVariant.danger,
        borderRadius: 12.0,
      );
      final copied = config.copyWith(borderRadius: 16.0);
      expect(copied.variant, ButtonVariant.danger);
      expect(copied.borderRadius, 16.0);
    });

    test('equality works', () {
      const a = ButtonStyleConfig(variant: ButtonVariant.text);
      const b = ButtonStyleConfig(variant: ButtonVariant.text);
      const c = ButtonStyleConfig(variant: ButtonVariant.outline);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode is consistent with equality', () {
      const a = ButtonStyleConfig(variant: ButtonVariant.text);
      const b = ButtonStyleConfig(variant: ButtonVariant.text);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('ButtonIconConfig', () {
    test('defaults to null for all fields', () {
      const config = ButtonIconConfig();
      expect(config.icon, isNull);
      expect(config.iconColor, isNull);
      expect(config.trailingIcon, isNull);
      expect(config.trailingIconColor, isNull);
    });

    test('copyWith replaces values', () {
      const config = ButtonIconConfig(icon: Icons.add);
      final copied = config.copyWith(trailingIcon: Icons.arrow_forward);
      expect(copied.icon, Icons.add);
      expect(copied.trailingIcon, Icons.arrow_forward);
    });

    test('equality works', () {
      const a = ButtonIconConfig(icon: Icons.add);
      const b = ButtonIconConfig(icon: Icons.add);
      const c = ButtonIconConfig(icon: Icons.remove);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode is consistent with equality', () {
      const a = ButtonIconConfig(icon: Icons.add);
      const b = ButtonIconConfig(icon: Icons.add);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('ButtonLayoutConfig', () {
    test('defaults to isExpanded true', () {
      const config = ButtonLayoutConfig();
      expect(config.isExpanded, isTrue);
    });

    test('copyWith replaces isExpanded', () {
      const config = ButtonLayoutConfig();
      final copied = config.copyWith(isExpanded: false);
      expect(copied.isExpanded, isFalse);
    });

    test('equality works', () {
      const a = ButtonLayoutConfig(isExpanded: true);
      const b = ButtonLayoutConfig(isExpanded: true);
      const c = ButtonLayoutConfig(isExpanded: false);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode is consistent with equality', () {
      const a = ButtonLayoutConfig(isExpanded: true);
      const b = ButtonLayoutConfig(isExpanded: true);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('ButtonStateConfig', () {
    test('defaults', () {
      const config = ButtonStateConfig();
      expect(config.isLoading, isFalse);
      expect(config.enabled, isTrue);
      expect(config.isSelected, isFalse);
      expect(config.loadingColor, isNull);
    });

    test('copyWith replaces values', () {
      const config = ButtonStateConfig();
      final copied = config.copyWith(isLoading: true, enabled: false);
      expect(copied.isLoading, isTrue);
      expect(copied.enabled, isFalse);
      expect(copied.isSelected, isFalse);
    });
  });
}
