import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/src/core/utils/nebux_color_converter.dart';

void main() {
  group('ColorConverter', () {
    const converter = ColorConverter();

    group('fromJson', () {
      test('returns same Color when input is Color', () {
        const input = Color(0xFF0000FF);
        final result = converter.fromJson(input);
        expect(result, equals(input));
      });

      test('parses int to Color', () {
        const input = 0xFF0000FF;
        final result = converter.fromJson(input);
        expect(result, equals(const Color(0xFF0000FF)));
      });

      test('parses 6-char hex string to Color with alpha', () {
        const input = '#FF0000';
        final result = converter.fromJson(input);
        expect(result, equals(const Color(0xFFFF0000)));
      });

      test('parses hex string without # to Color', () {
        const input = 'FF0000';
        final result = converter.fromJson(input);
        expect(result, equals(const Color(0xFFFF0000)));
      });

      test('parses 8-char hex string (ARGB) to Color', () {
        const input = '#80FF0000';
        final result = converter.fromJson(input);
        expect(result, equals(const Color(0x80FF0000)));
      });

      test('throws ArgumentError for null input', () {
        expect(
          () => const ColorConverter().fromJson(null),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for invalid string format', () {
        expect(
          () => const ColorConverter().fromJson('invalid'),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for 5-char hex (invalid)', () {
        expect(
          () => const ColorConverter().fromJson('#FFFFF'),
          throwsArgumentError,
        );
      });

      test('throws ArgumentError for unsupported type', () {
        expect(
          () => const ColorConverter().fromJson(3.14),
          throwsArgumentError,
        );
      });
    });

    group('toJson', () {
      test('returns ARGB int for Color', () {
        const color = Color(0xFFFF0000);
        final result = converter.toJson(color);
        expect(result, equals(0xFFFF0000));
      });

      test('returns correct int for Colors.red', () {
        final result = converter.toJson(Colors.red);
        expect(result, equals(Colors.red.toARGB32()));
      });
    });
  });

  group('LinearGradientConverter', () {
    const converter = LinearGradientConverter();

    group('fromJson', () {
      test('parses gradient with colors and alignments', () {
        final json = {
          'colors': [0xFF2196F3, 0xFF03A9F4],
          'begin': 'Alignment.topLeft',
          'end': 'Alignment.bottomRight',
        };
        final result = converter.fromJson(json);

        expect(result.colors.length, equals(2));
        expect(result.colors[0], equals(const Color(0xFF2196F3)));
        expect(result.colors[1], equals(const Color(0xFF03A9F4)));
        expect(result.begin, equals(Alignment.topLeft));
        expect(result.end, equals(Alignment.bottomRight));
      });

      test('defaults to topLeft alignment for unknown string', () {
        final json = {
          'colors': [0xFFFF0000],
          'begin': 'unknown',
          'end': null,
        };
        final result = converter.fromJson(json);

        expect(result.begin, equals(Alignment.topLeft));
        expect(result.end, equals(Alignment.topLeft));
      });

      test('parses all alignment values', () {
        final alignments = {
          'Alignment.topLeft': Alignment.topLeft,
          'Alignment.topCenter': Alignment.topCenter,
          'Alignment.topRight': Alignment.topRight,
          'Alignment.centerLeft': Alignment.centerLeft,
          'Alignment.center': Alignment.center,
          'Alignment.centerRight': Alignment.centerRight,
          'Alignment.bottomLeft': Alignment.bottomLeft,
          'Alignment.bottomCenter': Alignment.bottomCenter,
          'Alignment.bottomRight': Alignment.bottomRight,
        };

        alignments.forEach((key, expected) {
          final json = {
            'colors': [0xFFFF0000],
            'begin': key,
            'end': key,
          };
          final result = converter.fromJson(json);
          expect(result.begin, equals(expected), reason: key);
          expect(result.end, equals(expected), reason: key);
        });
      });
    });

    group('toJson', () {
      test('converts gradient to map', () {
        const gradient = LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF03A9F4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
        final result = converter.toJson(gradient);

        expect(result['colors'], equals([0xFF2196F3, 0xFF03A9F4]));
        expect(result['begin'], equals('Alignment.topLeft'));
        expect(result['end'], equals('Alignment.bottomRight'));
      });
    });
  });
}
