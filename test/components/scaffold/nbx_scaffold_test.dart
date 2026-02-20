import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import '../../helpers/nebux_test_helpers.dart';

void main() {
  group('NbxScaffold', () {
    testWidgets('renders body widget', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Hello World'),
        ),
      );

      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('renders with appBarConfig showing title', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(title: 'My Title'),
        ),
      );

      expect(find.text('My Title'), findsOneWidget);
    });

    testWidgets('renders without app bar when no appBarConfig', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
        ),
      );

      expect(find.byType(AppBar), findsNothing);
    });

    testWidgets('renders custom appBar when provided', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxScaffold(
          widgetName: 'test',
          body: const Text('Body'),
          appBar: AppBar(title: const Text('Custom AppBar')),
        ),
      );

      expect(find.text('Custom AppBar'), findsOneWidget);
    });

    testWidgets('shows divider when showDivider is true', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            showDivider: true,
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('does not show divider when showDivider is false', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            showDivider: false,
          ),
        ),
      );

      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('dividerThickness is configurable (D22)', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            showDivider: true,
            dividerThickness: 2.0,
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, 2.0);
    });

    testWidgets('dividerThickness defaults to 0.2', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            showDivider: true,
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, 0.2);
    });

    testWidgets('applies backgroundColor', (tester) async {
      const customColor = Color(0xFFFF0000);
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          backgroundColor: customColor,
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.backgroundColor, customColor);
    });

    testWidgets('uses nebuxColors.background when no backgroundColor', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.backgroundColor, testNebuxColors().background);
    });

    testWidgets('renders bottomNavigationBar', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxScaffold(
          widgetName: 'test',
          body: const Text('Body'),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      );

      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('renders floatingActionButton', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxScaffold(
          widgetName: 'test',
          body: const Text('Body'),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('wrapInContainer true wraps body with padding', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Padded Body'),
          bodyConfig: BodyConfig(wrapInContainer: true),
        ),
      );

      expect(find.text('Padded Body'), findsOneWidget);
      // The body should be wrapped in a Container > Padding
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('wrapInContainer false does not add extra padding', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('No Extra Padding'),
          bodyConfig: BodyConfig(wrapInContainer: false),
        ),
      );

      expect(find.text('No Extra Padding'), findsOneWidget);
    });

    testWidgets('resizeToAvoidBottomInset defaults to false', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.resizeToAvoidBottomInset, isFalse);
    });

    testWidgets('resizeToAvoidBottomInset can be set to true', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          bodyConfig: BodyConfig(resizeToAvoidBottomInset: true),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.resizeToAvoidBottomInset, isTrue);
    });

    testWidgets('extendBodyBehindAppBar defaults to true', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).last);
      expect(scaffold.extendBodyBehindAppBar, isTrue);
    });

    testWidgets('safeAreaConfig applies top and bottom', (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          safeAreaConfig: SafeAreaConfig(top: false, bottom: false),
        ),
      );

      final safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
      expect(safeArea.top, isFalse);
      expect(safeArea.bottom, isFalse);
    });

    testWidgets('safeAreaConfig defaults to top and bottom true', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
        ),
      );

      final safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
      expect(safeArea.top, isTrue);
      expect(safeArea.bottom, isTrue);
    });

    testWidgets('safeAreaConfig minimum applies custom EdgeInsets', (
      tester,
    ) async {
      const customMinimum = EdgeInsets.all(40);
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          safeAreaConfig: SafeAreaConfig(minimum: customMinimum),
        ),
      );

      final safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
      expect(safeArea.minimum, customMinimum);
    });

    testWidgets('app bar renders leading button when provided', (
      tester,
    ) async {
      await pumpNbxWidget(
        tester,
        NbxScaffold(
          widgetName: 'test',
          body: const Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            leadingButton: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('app bar renders actions', (tester) async {
      await pumpNbxWidget(
        tester,
        NbxScaffold(
          widgetName: 'test',
          body: const Text('Body'),
          appBarConfig: AppBarConfig(
            title: 'Title',
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('_hasAppBar is false when appBarConfig has no title/actions/leading',
        (tester) async {
      await pumpNbxWidget(
        tester,
        const NbxScaffold(
          widgetName: 'test',
          body: Text('Body'),
          appBarConfig: AppBarConfig(),
        ),
      );

      // No NbxAppBar should be rendered because _hasAppBar is false
      expect(find.byType(AppBar), findsNothing);
    });
  });

  group('AppBarConfig', () {
    test('defaults', () {
      const config = AppBarConfig();
      expect(config.title, isNull);
      expect(config.actions, isNull);
      expect(config.leadingButton, isNull);
      expect(config.centerTitle, isFalse);
      expect(config.showDivider, isFalse);
      expect(config.dividerThickness, 0.2);
      expect(config.backgroundColor, isNull);
    });
  });

  group('SafeAreaConfig', () {
    test('defaults', () {
      const config = SafeAreaConfig();
      expect(config.top, isTrue);
      expect(config.bottom, isTrue);
      expect(config.minimum, isNull);
    });
  });

  group('BodyConfig', () {
    test('defaults', () {
      const config = BodyConfig();
      expect(config.wrapInContainer, isTrue);
      expect(config.decoration, isNull);
      expect(config.resizeToAvoidBottomInset, isFalse);
      expect(config.exitMessage, isNull);
      expect(config.extendBodyBehindAppBar, isTrue);
    });
  });
}
