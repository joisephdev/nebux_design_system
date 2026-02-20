import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NbxInputType enum', () {
    test('has all expected values', () {
      expect(NbxInputType.values, hasLength(11));
      expect(NbxInputType.values, contains(NbxInputType.text));
      expect(NbxInputType.values, contains(NbxInputType.free));
      expect(NbxInputType.values, contains(NbxInputType.onlyText));
      expect(NbxInputType.values, contains(NbxInputType.textAndNumbers));
      expect(NbxInputType.values, contains(NbxInputType.dropdownMenu));
      expect(NbxInputType.values, contains(NbxInputType.alphabet));
      expect(NbxInputType.values, contains(NbxInputType.number));
      expect(NbxInputType.values, contains(NbxInputType.phone));
      expect(NbxInputType.values, contains(NbxInputType.password));
      expect(NbxInputType.values, contains(NbxInputType.decimalNumber));
      expect(NbxInputType.values, contains(NbxInputType.email));
    });
  });

  group('NbxInputDecorationStyle enum', () {
    test('has all expected values', () {
      expect(NbxInputDecorationStyle.values, hasLength(3));
      expect(
        NbxInputDecorationStyle.values,
        contains(NbxInputDecorationStyle.floating),
      );
      expect(
        NbxInputDecorationStyle.values,
        contains(NbxInputDecorationStyle.outlined),
      );
      expect(
        NbxInputDecorationStyle.values,
        contains(NbxInputDecorationStyle.filled),
      );
    });

    test('isFilled returns true only for filled', () {
      expect(NbxInputDecorationStyle.filled.isFilled, isTrue);
      expect(NbxInputDecorationStyle.outlined.isFilled, isFalse);
      expect(NbxInputDecorationStyle.floating.isFilled, isFalse);
    });

    test('isOutlined returns true only for outlined', () {
      expect(NbxInputDecorationStyle.outlined.isOutlined, isTrue);
      expect(NbxInputDecorationStyle.filled.isOutlined, isFalse);
      expect(NbxInputDecorationStyle.floating.isOutlined, isFalse);
    });

    test('isFloating returns true only for floating', () {
      expect(NbxInputDecorationStyle.floating.isFloating, isTrue);
      expect(NbxInputDecorationStyle.filled.isFloating, isFalse);
      expect(NbxInputDecorationStyle.outlined.isFloating, isFalse);
    });
  });

  group('NbxSuffixIconType enum', () {
    test('has all expected values', () {
      expect(NbxSuffixIconType.values, hasLength(3));
      expect(NbxSuffixIconType.values, contains(NbxSuffixIconType.none));
      expect(NbxSuffixIconType.values, contains(NbxSuffixIconType.eye));
      expect(NbxSuffixIconType.values, contains(NbxSuffixIconType.cancel));
    });
  });
}
