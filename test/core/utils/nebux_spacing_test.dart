import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('Spacing Constants', () {
    test('defaultPaddingSize is 16', () {
      expect(defaultPaddingSize, equals(16.0));
    });

    group('height spacers', () {
      test('heightSpaceDefault has height 16', () {
        expect(heightSpaceDefault, isA<SizedBox>());
        expect(heightSpaceDefault.height, equals(16.0));
      });

      test('all height spacers have correct values', () {
        expect(heightSpace2.height, equals(2.0));
        expect(heightSpace4.height, equals(4.0));
        expect(heightSpace6.height, equals(6.0));
        expect(heightSpace8.height, equals(8.0));
        expect(heightSpace10.height, equals(10.0));
        expect(heightSpace12.height, equals(12.0));
        expect(heightSpace15.height, equals(15.0));
        expect(heightSpace16.height, equals(16.0));
        expect(heightSpace20.height, equals(20.0));
        expect(heightSpace24.height, equals(24.0));
        expect(heightSpace25.height, equals(25.0));
        expect(heightSpace30.height, equals(30.0));
        expect(heightSpace32.height, equals(32.0));
        expect(heightSpace40.height, equals(40.0));
        expect(heightSpace48.height, equals(48.0));
        expect(heightSpace50.height, equals(50.0));
        expect(heightSpace60.height, equals(60.0));
        expect(heightSpace64.height, equals(64.0));
        expect(heightSpace80.height, equals(80.0));
        expect(heightSpace100.height, equals(100.0));
        expect(heightSpace200.height, equals(200.0));
      });
    });

    group('width spacers', () {
      test('widthSpaceDefault has width 16', () {
        expect(widthSpaceDefault, isA<SizedBox>());
        expect(widthSpaceDefault.width, equals(16.0));
      });

      test('all width spacers have correct values', () {
        expect(widthSpace2.width, equals(2.0));
        expect(widthSpace4.width, equals(4.0));
        expect(widthSpace6.width, equals(6.0));
        expect(widthSpace8.width, equals(8.0));
        expect(widthSpace10.width, equals(10.0));
        expect(widthSpace12.width, equals(12.0));
        expect(widthSpace14.width, equals(14.0));
        expect(widthSpace15.width, equals(15.0));
        expect(widthSpace16.width, equals(16.0));
        expect(widthSpace18.width, equals(18.0));
        expect(widthSpace20.width, equals(20.0));
        expect(widthSpace24.width, equals(24.0));
        expect(widthSpace25.width, equals(25.0));
        expect(widthSpace48.width, equals(48.0));
      });
    });
  });
}
