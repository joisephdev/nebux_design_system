import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MarginExtensions', () {
    testWidgets('marginAll wraps with all-sides margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginAll(16)),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(const EdgeInsets.all(16)));
    });

    testWidgets('marginLeft wraps with left margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginLeft(8)),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(const EdgeInsets.only(left: 8)));
    });

    testWidgets('marginRight wraps with right margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginRight(12)),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(const EdgeInsets.only(right: 12)));
    });

    testWidgets('marginTop wraps with top margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginTop(4)),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(const EdgeInsets.only(top: 4)));
    });

    testWidgets('marginBottom wraps with bottom margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginBottom(20)),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(const EdgeInsets.only(bottom: 20)));
    });

    testWidgets('marginSymmetric wraps with symmetric margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(
          home: child.marginSymmetric(horizontal: 16, vertical: 8),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(
        container.margin,
        equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      );
    });

    testWidgets('marginOnly wraps with specific side margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(
          home: child.marginOnly(left: 2, top: 4, right: 6, bottom: 8),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(
        container.margin,
        equals(const EdgeInsets.only(left: 2, top: 4, right: 6, bottom: 8)),
      );
    });

    testWidgets('marginZero wraps with zero margin', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.marginZero),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.margin, equals(EdgeInsets.zero));
    });
  });
}
