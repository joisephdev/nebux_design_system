import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PaddingExtensions', () {
    testWidgets('nbxPaddingLeft wraps with left padding', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingLeft(16)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(const EdgeInsets.only(left: 16)));
    });

    testWidgets('nbxPaddingRight wraps with right padding', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingRight(8)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(const EdgeInsets.only(right: 8)));
    });

    testWidgets('nbxPaddingTop wraps with top padding', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingTop(12)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(const EdgeInsets.only(top: 12)));
    });

    testWidgets('nbxPaddingBottom wraps with bottom padding', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingBottom(20)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(const EdgeInsets.only(bottom: 20)));
    });

    testWidgets('nbxPaddingSymmetric wraps with symmetric padding',
        (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(
          home: child.nbxPaddingSymmetric(horizontal: 16, vertical: 8),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      );
    });

    testWidgets('nbxPaddingHorizontal wraps with horizontal padding',
        (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingHorizontal(24)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 24)),
      );
    });

    testWidgets('nbxPaddingVertical wraps with vertical padding',
        (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.nbxPaddingVertical(10)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(vertical: 10)),
      );
    });

    testWidgets('nbxPaddingOnly wraps with specific side padding',
        (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(
          home: child.nbxPaddingOnly(left: 4, top: 8, right: 12, bottom: 16),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.only(left: 4, top: 8, right: 12, bottom: 16)),
      );
    });

    testWidgets('paddingZero wraps with zero padding', (tester) async {
      const child = SizedBox(width: 10, height: 10);

      await tester.pumpWidget(
        MaterialApp(home: child.paddingZero),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(EdgeInsets.zero));
    });
  });
}
