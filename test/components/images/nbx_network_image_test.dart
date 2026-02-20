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

    test('accepts color and colorBlendMode', () {
      const config = NbxImageStyleConfig(
        color: Colors.red,
        colorBlendMode: BlendMode.multiply,
      );
      expect(config.color, equals(Colors.red));
      expect(config.colorBlendMode, equals(BlendMode.multiply));
    });

    test('accepts border and shadow', () {
      final config = NbxImageStyleConfig(
        border: Border.all(color: Colors.black, width: 2),
        shadow: const [BoxShadow(color: Colors.grey, blurRadius: 4)],
      );
      expect(config.border, isNotNull);
      expect(config.shadow, isNotNull);
      expect(config.shadow!.length, equals(1));
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

    test('applies width and height', () {
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        width: 100,
        height: 100,
      );
      expect(image.width, equals(100));
      expect(image.height, equals(100));
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

    test('default fit is BoxFit.cover', () {
      const image = NbxNetworkImage(imageUrl: 'https://example.com/image.png');
      expect(image.fit, equals(BoxFit.cover));
    });

    test('stores all constructor parameters', () {
      const placeholder = SizedBox(width: 10, height: 10);
      const errorWidget = SizedBox(width: 20, height: 20);
      final headers = {'Authorization': 'Bearer token'};

      final image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        width: 200,
        height: 150,
        fit: BoxFit.contain,
        placeholder: placeholder,
        errorWidget: errorWidget,
        httpHeaders: headers,
      );

      expect(image.imageUrl, equals('https://example.com/image.png'));
      expect(image.width, equals(200));
      expect(image.height, equals(150));
      expect(image.fit, equals(BoxFit.contain));
      expect(image.placeholder, equals(placeholder));
      expect(image.errorWidget, equals(errorWidget));
      expect(image.httpHeaders, equals(headers));
    });

    test('buildDefaultPlaceholder returns Container with image icon', () {
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        width: 100,
        height: 100,
      );
      final widget = image.buildDefaultPlaceholder();
      expect(widget, isA<Container>());
    });

    test('buildDefaultErrorWidget returns Container with error content', () {
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        width: 100,
        height: 100,
      );
      final widget = image.buildDefaultErrorWidget();
      expect(widget, isA<Container>());
    });

    test('stores style config values', () {
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        width: 100,
        height: 100,
        styleConfig: NbxImageStyleConfig(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          clipBehavior: Clip.hardEdge,
        ),
      );
      expect(
        image.styleConfig.borderRadius,
        equals(const BorderRadius.all(Radius.circular(20))),
      );
      expect(image.styleConfig.clipBehavior, equals(Clip.hardEdge));
    });

    test('stores custom placeholder widget', () {
      const placeholder = SizedBox(width: 50, height: 50);
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        placeholder: placeholder,
      );
      expect(image.placeholder, equals(placeholder));
    });

    test('stores custom error widget', () {
      const error = SizedBox(width: 50, height: 50);
      const image = NbxNetworkImage(
        imageUrl: 'https://example.com/image.png',
        errorWidget: error,
      );
      expect(image.errorWidget, equals(error));
    });

    test('default config instances are const', () {
      const image = NbxNetworkImage(imageUrl: 'https://example.com/image.png');
      expect(image.cacheConfig, isA<NbxImageCacheConfig>());
      expect(image.animationConfig, isA<NbxImageAnimationConfig>());
      expect(image.progressConfig, isA<NbxImageProgressConfig>());
      expect(image.styleConfig, isA<NbxImageStyleConfig>());
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

    testWidgets('circular applies custom border radius when provided',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.circular(
              imageUrl: 'https://example.com/image.png',
              radius: 40,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.width, equals(80));
      expect(image.height, equals(80));
      expect(image.styleConfig.borderRadius,
          equals(BorderRadius.circular(10)));
    });

    testWidgets('circular defaults border radius to radius value',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.circular(
              imageUrl: 'https://example.com/image.png',
              radius: 30,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.styleConfig.borderRadius,
          equals(BorderRadius.circular(30)));
    });

    testWidgets('square accepts custom fit', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.square(
              imageUrl: 'https://example.com/image.png',
              size: 80,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.fit, equals(BoxFit.contain));
    });

    testWidgets('rounded without explicit dimensions leaves them null',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.rounded(
              imageUrl: 'https://example.com/image.png',
              borderRadius: 8,
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.width, isNull);
      expect(image.height, isNull);
    });

    testWidgets('square passes border and shadow through', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NbxNetworkImageExtensions.square(
              imageUrl: 'https://example.com/image.png',
              size: 64,
              border: Border.all(color: Colors.blue),
              shadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
            ),
          ),
        ),
      );

      final image = tester.widget<NbxNetworkImage>(
        find.byType(NbxNetworkImage),
      );
      expect(image.styleConfig.border, isNotNull);
      expect(image.styleConfig.shadow, isNotNull);
      expect(image.styleConfig.shadow!.length, equals(1));
    });
  });
}
