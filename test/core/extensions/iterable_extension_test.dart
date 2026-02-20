import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('IterableExtensions', () {
    group('mapIndexed', () {
      test('maps elements with their index', () {
        final result =
            ['a', 'b', 'c'].mapIndexed((element, index) => '$index:$element');

        expect(result.toList(), equals(['0:a', '1:b', '2:c']));
      });

      test('returns empty iterable for empty list', () {
        final result =
            <String>[].mapIndexed((element, index) => '$index:$element');

        expect(result.toList(), isEmpty);
      });

      test('provides correct index for single element', () {
        final result =
            ['only'].mapIndexed((element, index) => index);

        expect(result.toList(), equals([0]));
      });

      test('works with different return types', () {
        final result =
            [10, 20, 30].mapIndexed((element, index) => element * index);

        expect(result.toList(), equals([0, 20, 60]));
      });
    });
  });
}
