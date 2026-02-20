import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import 'package:nebux_design_system/src/components/shimmers/hunch_animation.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/shimmer_animation_wrapper.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/shimmer_container_builder.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxShimmerAnimation', () {
    testWidgets('renders child with ShimmerAnimationWrapper', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxShimmerAnimation(
          child: SizedBox(width: 50, height: 50),
        ),
      );

      expect(find.byType(ShimmerAnimationWrapper), findsOneWidget);
    });

    testWidgets('uses default gradient when none provided', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxShimmerAnimation(
          child: SizedBox(width: 50, height: 50),
        ),
      );

      final wrapper = tester.widget<ShimmerAnimationWrapper>(
        find.byType(ShimmerAnimationWrapper),
      );
      expect(wrapper.gradient, ShimmerConstants.defaultGradient);
    });

    testWidgets('applies custom gradient', (tester) async {
      const customGradient = LinearGradient(
        colors: [Colors.red, Colors.blue],
      );

      await pumpNbxWidget(
        tester,
        const NbxShimmerAnimation(
          gradient: customGradient,
          child: SizedBox(width: 50, height: 50),
        ),
      );

      final wrapper = tester.widget<ShimmerAnimationWrapper>(
        find.byType(ShimmerAnimationWrapper),
      );
      expect(wrapper.gradient, customGradient);
    });
  });

  group('ShimmerAnimationWrapper', () {
    testWidgets('wraps child with HunchAnimation and SkeletonTheme', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const ShimmerAnimationWrapper(
          gradient: ShimmerConstants.defaultGradient,
          child: SizedBox(width: 50, height: 50),
        ),
      );

      expect(find.byType(HunchAnimation), findsOneWidget);
      expect(find.byType(SkeletonTheme), findsOneWidget);
      expect(find.byType(SkeletonItem), findsOneWidget);
    });
  });

  group('ShimmerContainerBuilder', () {
    testWidgets('renders Container widget', (tester) async {
      const style = ShimmerSkeletonStyle(width: 120, height: 60);

      await pumpNbxWidget(
        tester,
        const ShimmerContainerBuilder(style: style),
      );

      expect(find.byType(ShimmerContainerBuilder), findsOneWidget);
    });

    testWidgets('applies default grey color when no customColor', (
      tester,
    ) async {
      const style = ShimmerSkeletonStyle(width: 100, height: 50);

      await pumpNbxWidget(
        tester,
        const ShimmerContainerBuilder(style: style),
      );

      final containerFinder = find.descendant(
        of: find.byType(ShimmerContainerBuilder),
        matching: find.byType(Container),
      );
      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.grey.shade300);
    });

    testWidgets('applies customColor when provided', (tester) async {
      const style = ShimmerSkeletonStyle(
        width: 100,
        height: 50,
        customColor: Colors.blue,
      );

      await pumpNbxWidget(
        tester,
        const ShimmerContainerBuilder(style: style),
      );

      final containerFinder = find.descendant(
        of: find.byType(ShimmerContainerBuilder),
        matching: find.byType(Container),
      );
      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.blue);
    });

    testWidgets('applies borderRadius for rectangle shape', (tester) async {
      const style = ShimmerSkeletonStyle(
        width: 100,
        height: 50,
        borderRadiusDouble: 12.0,
        boxShape: BoxShape.rectangle,
      );

      await pumpNbxWidget(
        tester,
        const ShimmerContainerBuilder(style: style),
      );

      final containerFinder = find.descendant(
        of: find.byType(ShimmerContainerBuilder),
        matching: find.byType(Container),
      );
      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(12.0));
    });

    testWidgets('uses circle shape without borderRadius', (tester) async {
      const style = ShimmerSkeletonStyle(
        width: 50,
        height: 50,
        boxShape: BoxShape.circle,
      );

      await pumpNbxWidget(
        tester,
        const ShimmerContainerBuilder(style: style),
      );

      final containerFinder = find.descendant(
        of: find.byType(ShimmerContainerBuilder),
        matching: find.byType(Container),
      );
      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.shape, BoxShape.circle);
      expect(decoration.borderRadius, isNull);
    });
  });

  group('NbxShimmerContainer', () {
    testWidgets('renders NbxShimmerAnimation', (tester) async {
      const style = ShimmerSkeletonStyle(width: 100, height: 80);

      await pumpNbxWidget(
        tester,
        const NbxShimmerContainer(style: style),
      );

      expect(find.byType(NbxShimmerContainer), findsOneWidget);
      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
    });
  });

  group('NbxShimmerContainerExpanded', () {
    testWidgets('renders with NbxShimmerAnimation', (tester) async {
      const style = ShimmerSkeletonStyle(width: 100, height: 80);

      await pumpNbxWidget(
        tester,
        const Row(
          children: [
            NbxShimmerContainerExpanded(style: style),
          ],
        ),
      );

      expect(find.byType(NbxShimmerContainerExpanded), findsOneWidget);
      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
    });
  });

  group('NbxShimmerContainerList', () {
    testWidgets('renders vertical list with NbxShimmerAnimation', (
      tester,
    ) async {
      const style = ShimmerSkeletonStyle(width: 100, height: 30);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 300,
          child: NbxShimmerContainerList(
            style: style,
            itemCount: 3,
            isColumn: true,
          ),
        ),
      );

      expect(find.byType(NbxShimmerContainerList), findsOneWidget);
      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
    });

    testWidgets('renders horizontal list', (tester) async {
      const style = ShimmerSkeletonStyle(width: 80, height: 40);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 100,
          child: NbxShimmerContainerList(
            style: style,
            itemCount: 3,
            isColumn: false,
          ),
        ),
      );

      expect(find.byType(NbxShimmerContainerList), findsOneWidget);
    });
  });

  group('NbxShimmerGrid', () {
    testWidgets('renders NbxShimmerAnimation', (tester) async {
      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 400,
          child: NbxShimmerGrid(itemCount: 6),
        ),
      );

      expect(find.byType(NbxShimmerGrid), findsOneWidget);
      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
    });
  });

  group('NbxShimmerListTile', () {
    testWidgets('renders NbxShimmerAnimation with title', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(titleStyle: titleStyle),
      );

      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('renders with leading style', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const leadingStyle = ShimmerSkeletonStyle(width: 40, height: 40);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          leadingStyle: leadingStyle,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('renders with trailing style', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const trailingStyle = ShimmerSkeletonStyle(width: 40, height: 40);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          trailingStyle: trailingStyle,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('renders with subtitle style', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const subtitleStyle = ShimmerSkeletonStyle(width: 100, height: 16);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('renders with paragraph style', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const paragraphStyle = ShimmerSkeletonStyle(width: 200, height: 14);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          paragraphStyle: paragraphStyle,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('hasContainer true renders without error', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          hasContainer: true,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('applies custom padding', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          padding: EdgeInsets.all(16),
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });

    testWidgets('applies custom spacing', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const subtitleStyle = ShimmerSkeletonStyle(width: 100, height: 16);

      await pumpNbxWidget(
        tester,
        const NbxShimmerListTile(
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
          contentSpacing: 20,
          verticalSpacing: 12,
        ),
      );

      expect(find.byType(NbxShimmerListTile), findsOneWidget);
    });
  });

  group('NbxShimmerListTileListView', () {
    testWidgets('renders widget tree', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 300,
          child: NbxShimmerListTileListView(
            itemCount: 3,
            titleStyle: titleStyle,
            heightFull: 250,
          ),
        ),
      );

      expect(find.byType(NbxShimmerListTileListView), findsOneWidget);
    });

    testWidgets('renders with custom divider', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 300,
          child: NbxShimmerListTileListView(
            itemCount: 2,
            titleStyle: titleStyle,
            heightFull: 250,
            dividerWidget: SizedBox(height: 10),
          ),
        ),
      );

      expect(find.byType(NbxShimmerListTileListView), findsOneWidget);
    });

    testWidgets('passes through all styling parameters', (tester) async {
      const titleStyle = ShimmerSkeletonStyle(width: 150, height: 20);
      const leadingStyle = ShimmerSkeletonStyle(width: 40, height: 40);
      const subtitleStyle = ShimmerSkeletonStyle(width: 100, height: 16);
      const trailingStyle = ShimmerSkeletonStyle(width: 30, height: 30);
      const paragraphStyle = ShimmerSkeletonStyle(width: 200, height: 14);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 400,
          child: NbxShimmerListTileListView(
            itemCount: 2,
            titleStyle: titleStyle,
            leadingStyle: leadingStyle,
            subtitleStyle: subtitleStyle,
            trailingStyle: trailingStyle,
            paragraphStyle: paragraphStyle,
            heightFull: 350,
            hasContainer: true,
            contentSpacing: 12,
            verticalSpacing: 8,
            padding: EdgeInsets.all(8),
          ),
        ),
      );

      expect(find.byType(NbxShimmerListTileListView), findsOneWidget);
    });
  });

  group('NbxShimmerTwiceContainerList', () {
    testWidgets('renders widget tree', (tester) async {
      const styleOne = ShimmerSkeletonStyle(width: 80, height: 40);
      const styleTwo = ShimmerSkeletonStyle(width: 60, height: 30);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 400,
          child: NbxShimmerTwiceContainerList(
            heightFull: 350,
            axis: Axis.vertical,
            skeletonListOneStyle: styleOne,
            itemCountListOne: 2,
            isColumnListOne: true,
            skeletonListTwoStyle: styleTwo,
            itemCountListTwo: 2,
            isColumnListTwo: true,
          ),
        ),
      );

      expect(find.byType(NbxShimmerTwiceContainerList), findsOneWidget);
      expect(find.byType(NbxShimmerAnimation), findsOneWidget);
    });

    testWidgets('renders with horizontal axis', (tester) async {
      const styleOne = ShimmerSkeletonStyle(width: 80, height: 40);
      const styleTwo = ShimmerSkeletonStyle(width: 60, height: 30);

      await pumpNbxWidget(
        tester,
        const SizedBox(
          height: 200,
          width: 600,
          child: NbxShimmerTwiceContainerList(
            heightFull: 150,
            axis: Axis.horizontal,
            skeletonListOneStyle: styleOne,
            itemCountListOne: 2,
            isColumnListOne: false,
            skeletonListTwoStyle: styleTwo,
            itemCountListTwo: 2,
            isColumnListTwo: false,
          ),
        ),
      );

      expect(find.byType(NbxShimmerTwiceContainerList), findsOneWidget);
    });
  });
}
