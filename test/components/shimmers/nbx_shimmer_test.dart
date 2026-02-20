import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import 'package:nebux_design_system/src/components/shimmers/hunch_animation.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxShimmer', () {
    testWidgets('renders child widget', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxShimmer(
          child: SizedBox(width: 100, height: 50),
        ),
      );

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('wraps child in SkeletonTheme and SkeletonItem', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxShimmer(
          child: Text('Loading...'),
        ),
      );

      expect(find.byType(SkeletonTheme), findsOneWidget);
      expect(find.byType(SkeletonItem), findsOneWidget);
    });

    testWidgets('applies custom baseColor and highlightColor', (
      tester,
    ) async {
      const baseColor = Color(0xFFFF0000);
      const highlightColor = Color(0xFF00FF00);

      await pumpNbxWidget(
        tester,
        const NbxShimmer(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: SizedBox(width: 100, height: 50),
        ),
      );

      final theme = tester.widget<SkeletonTheme>(
        find.byType(SkeletonTheme),
      );
      final gradient = theme.shimmerGradient!;
      expect(gradient.colors[0], baseColor);
      expect(gradient.colors[1], highlightColor);
      expect(gradient.colors[2], baseColor);
    });

    testWidgets('uses theme colors when no custom colors provided', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxShimmer(
          child: SizedBox(width: 100, height: 50),
        ),
      );

      final theme = tester.widget<SkeletonTheme>(
        find.byType(SkeletonTheme),
      );
      final gradient = theme.shimmerGradient!;
      final colors = testNebuxColors();
      expect(gradient.colors[0], colors.cardColor);
      expect(gradient.colors[1], colors.background);
      expect(gradient.colors[2], colors.cardColor);
    });
  });

  group('HunchAnimation', () {
    testWidgets('renders child widget', (tester) async {
      await pumpNbxWidget(
        tester,
        const HunchAnimation(
          child: Text('Animating'),
        ),
      );

      expect(find.text('Animating'), findsOneWidget);
    });

    testWidgets('contains a FadeTransition descendant', (tester) async {
      await pumpNbxWidget(
        tester,
        const HunchAnimation(
          child: Text('Animating'),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(HunchAnimation),
          matching: find.byType(FadeTransition),
        ),
        findsOneWidget,
      );
    });

    testWidgets('animation runs over time', (tester) async {
      await pumpNbxWidget(
        tester,
        const HunchAnimation(
          child: Text('Pulse'),
        ),
      );

      final fadeFinder = find.descendant(
        of: find.byType(HunchAnimation),
        matching: find.byType(FadeTransition),
      );
      final fadeTransition = tester.widget<FadeTransition>(fadeFinder);
      final initialOpacity = fadeTransition.opacity.value;

      // Advance partway through the animation
      await tester.pump(const Duration(milliseconds: 500));

      final fadeTransitionAfter = tester.widget<FadeTransition>(fadeFinder);
      final laterOpacity = fadeTransitionAfter.opacity.value;

      // The opacity should have changed during animation
      expect(laterOpacity, isNot(equals(initialOpacity)));
    });

    testWidgets('disposes animation controller without error', (tester) async {
      await pumpNbxWidget(
        tester,
        const HunchAnimation(
          child: Text('Dispose test'),
        ),
      );

      // Pumping a different widget triggers disposal
      await pumpNbxWidget(
        tester,
        const Text('Replaced'),
      );

      expect(find.text('Replaced'), findsOneWidget);
    });
  });

  group('ShimmerSkeletonStyle', () {
    test('defaults', () {
      const style = ShimmerSkeletonStyle(width: 100);
      expect(style.width, 100);
      expect(style.height, isNull);
      expect(style.borderRadiusDouble, 8.0);
      expect(style.boxShape, BoxShape.rectangle);
      expect(style.customColor, isNull);
    });

    test('copyWith replaces values', () {
      const style = ShimmerSkeletonStyle(width: 100, height: 50);
      final copied = style.copyWith(width: 200, borderRadiusDouble: 16.0);
      expect(copied.width, 200);
      expect(copied.height, 50);
      expect(copied.borderRadiusDouble, 16.0);
    });

    test('equality works', () {
      const a = ShimmerSkeletonStyle(width: 100, height: 50);
      const b = ShimmerSkeletonStyle(width: 100, height: 50);
      const c = ShimmerSkeletonStyle(width: 200, height: 50);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode is consistent with equality', () {
      const a = ShimmerSkeletonStyle(width: 100, height: 50);
      const b = ShimmerSkeletonStyle(width: 100, height: 50);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('ShimmerConstants', () {
    test('defaultGradient has five colors', () {
      expect(ShimmerConstants.defaultGradient.colors.length, 5);
    });

    test('defaultGradient has five stops', () {
      expect(ShimmerConstants.defaultGradient.stops!.length, 5);
    });

    test('defaultSpacing is 10.0', () {
      expect(ShimmerConstants.defaultSpacing, 10.0);
    });

    test('defaultBorderRadius is 8.0', () {
      expect(ShimmerConstants.defaultBorderRadius, 8.0);
    });

    test('defaultShadow returns a list of BoxShadow', () {
      final shadow = ShimmerConstants.defaultShadow;
      expect(shadow, isA<List<BoxShadow>>());
      expect(shadow.length, 1);
    });

    test('defaultPadding is EdgeInsets.all(8.0)', () {
      expect(ShimmerConstants.defaultPadding, const EdgeInsets.all(8.0));
    });

    test('defaultHorizontalPadding is symmetric horizontal 16', () {
      expect(
        ShimmerConstants.defaultHorizontalPadding,
        const EdgeInsets.symmetric(horizontal: 16),
      );
    });
  });
}
