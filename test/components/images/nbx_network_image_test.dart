import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NbxImageCacheConfig', () {
    test('uses default values', () {
      const config = NbxImageCacheConfig();
      expect(config.memCacheWidth, isNull);
      expect(config.memCacheHeight, isNull);
      expect(config.maxWidthDiskCache, isNull);
      expect(config.maxHeightDiskCache, isNull);
      expect(config.cacheKey, isNull);
      expect(config.useOldImageOnUrlChange, isFalse);
      expect(config.cacheManager, isNull);
    });

    test('accepts custom values', () {
      const config = NbxImageCacheConfig(
        memCacheWidth: 100,
        memCacheHeight: 200,
        maxWidthDiskCache: 500,
        maxHeightDiskCache: 600,
        cacheKey: 'test_key',
        useOldImageOnUrlChange: true,
      );
      expect(config.memCacheWidth, equals(100));
      expect(config.memCacheHeight, equals(200));
      expect(config.maxWidthDiskCache, equals(500));
      expect(config.maxHeightDiskCache, equals(600));
      expect(config.cacheKey, equals('test_key'));
      expect(config.useOldImageOnUrlChange, isTrue);
    });
  });

  group('NbxImageAnimationConfig', () {
    test('uses default values', () {
      const config = NbxImageAnimationConfig();
      expect(config.fadeInDuration, equals(const Duration(milliseconds: 300)));
      expect(config.fadeOutDuration, equals(const Duration(milliseconds: 300)));
      expect(config.fadeInCurve, equals(Curves.easeOut));
      expect(config.fadeOutCurve, equals(Curves.easeIn));
    });

    test('accepts custom values', () {
      const config = NbxImageAnimationConfig(
        fadeInDuration: Duration(milliseconds: 500),
        fadeOutDuration: Duration(milliseconds: 400),
        fadeInCurve: Curves.easeIn,
        fadeOutCurve: Curves.easeOut,
      );
      expect(config.fadeInDuration, equals(const Duration(milliseconds: 500)));
      expect(config.fadeOutDuration, equals(const Duration(milliseconds: 400)));
      expect(config.fadeInCurve, equals(Curves.easeIn));
      expect(config.fadeOutCurve, equals(Curves.easeOut));
    });
  });

  group('NbxImageProgressConfig', () {
    test('uses default values', () {
      const config = NbxImageProgressConfig();
      expect(config.progressIndicatorBuilder, isNull);
      expect(config.progressIndicatorSize, equals(const Size(20, 20)));
      expect(config.progressIndicatorColor, isNull);
      expect(config.progressIndicatorStrokeWidth, equals(2.0));
      expect(config.progressIndicatorBackgroundColor, isNull);
      expect(config.progressIndicatorCircular, isTrue);
    });

    test('accepts custom values', () {
      const config = NbxImageProgressConfig(
        progressIndicatorSize: Size(30, 30),
        progressIndicatorColor: Colors.red,
        progressIndicatorStrokeWidth: 3.0,
        progressIndicatorBackgroundColor: Colors.grey,
        progressIndicatorCircular: false,
      );
      expect(config.progressIndicatorSize, equals(const Size(30, 30)));
      expect(config.progressIndicatorColor, equals(Colors.red));
      expect(config.progressIndicatorStrokeWidth, equals(3.0));
      expect(config.progressIndicatorBackgroundColor, equals(Colors.grey));
      expect(config.progressIndicatorCircular, isFalse);
    });
  });

  group('NbxImageStyleConfig', () {
    test('uses default values', () {
      const config = NbxImageStyleConfig();
      expect(config.borderRadius, isNull);
      expect(config.border, isNull);
      expect(config.shadow, isNull);
      expect(config.clipBehavior, equals(Clip.antiAlias));
      expect(config.color, isNull);
      expect(config.colorBlendMode, isNull);
      expect(config.filterQuality, equals(FilterQuality.low));
      expect(config.repeat, equals(ImageRepeat.noRepeat));
      expect(config.matchTextDirection, isFalse);
    });

    test('accepts custom values', () {
      const config = NbxImageStyleConfig(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        clipBehavior: Clip.hardEdge,
        filterQuality: FilterQuality.high,
        repeat: ImageRepeat.repeat,
        matchTextDirection: true,
      );
      expect(config.clipBehavior, equals(Clip.hardEdge));
      expect(config.filterQuality, equals(FilterQuality.high));
      expect(config.repeat, equals(ImageRepeat.repeat));
      expect(config.matchTextDirection, isTrue);
    });
  });

  group('NbxNetworkImage', () {
    testWidgets('renders with minimal parameters', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NbxNetworkImage(imageUrl: 'https://example.com/image.png'),
          ),
        ),
      );

      expect(find.byType(NbxNetworkImage), findsOneWidget);
    });

    testWidgets('applies width and height', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NbxNetworkImage(
              imageUrl: 'https://example.com/image.png',
              width: 100,
              height: 100,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.maxWidth, equals(100));
      expect(container.constraints?.maxHeight, equals(100));
    });

    testWidgets('accepts config classes', (tester) async {
      const cacheConfig = NbxImageCacheConfig(
        memCacheWidth: 100,
        memCacheHeight: 100,
      );
      const animationConfig = NbxImageAnimationConfig(
        fadeInDuration: Duration(milliseconds: 500),
      );
      const progressConfig = NbxImageProgressConfig(
        progressIndicatorCircular: false,
      );
      const styleConfig = NbxImageStyleConfig(
        filterQuality: FilterQuality.high,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NbxNetworkImage(
              imageUrl: 'https://example.com/image.png',
              cacheConfig: cacheConfig,
              animationConfig: animationConfig,
              progressConfig: progressConfig,
              styleConfig: styleConfig,
            ),
          ),
        ),
      );

      expect(find.byType(NbxNetworkImage), findsOneWidget);
    });
  });

  group('NbxNetworkImageExtensions', () {
    testWidgets('circular creates circular image', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.circular(
              imageUrl: 'https://example.com/image.png',
              radius: 50,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.width, equals(100)); // radius * 2
      expect(image.height, equals(100));
    });

    testWidgets('square creates square image', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.square(
              imageUrl: 'https://example.com/image.png',
              size: 100,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.width, equals(100));
      expect(image.height, equals(100));
    });

    testWidgets('rounded creates image with rounded corners', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.rounded(
              imageUrl: 'https://example.com/image.png',
              width: 100,
              height: 100,
              borderRadius: 16,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.width, equals(100));
      expect(image.height, equals(100));
    });
  });
}
