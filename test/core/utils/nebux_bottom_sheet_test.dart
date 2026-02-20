import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NebuxBottomSheet', () {
    testWidgets('showBottomSheet displays a modal bottom sheet',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  NebuxBottomSheet.showBottomSheet(
                    context,
                    body: const Text('Bottom Sheet Content'),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Bottom Sheet Content'), findsOneWidget);
    });

    testWidgets('showBottomSheet can be dismissed when isDismissible is true',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  NebuxBottomSheet.showBottomSheet(
                    context,
                    body: const Text('Dismissible'),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Dismissible'), findsOneWidget);

      // Tap outside the bottom sheet (scrim) to dismiss
      await tester.tapAt(const Offset(20, 20));
      await tester.pumpAndSettle();

      expect(find.text('Dismissible'), findsNothing);
    });

    testWidgets('showBottomSheet with custom height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  NebuxBottomSheet.showBottomSheet(
                    context,
                    body: const Text('Custom Height'),
                    height: 200,
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Custom Height'), findsOneWidget);

      // Verify SizedBox with custom height
      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.text('Custom Height'),
          matching: find.byType(SizedBox),
        ).first,
      );
      expect(sizedBox.height, equals(200.0));
    });
  });
}
