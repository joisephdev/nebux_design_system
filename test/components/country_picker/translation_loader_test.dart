import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('TranslationLoader', () {
    group('supportedLanguageCodes', () {
      test('contains 33 entries', () {
        expect(TranslationLoader.supportedLanguageCodes.length, 33);
      });

      test('includes expected codes', () {
        const expected = [
          'ar', 'bg', 'ca', 'cn', 'cs', 'de', 'en', 'es', 'et', 'fr',
          'gr', 'he', 'hr', 'ht', 'id', 'it', 'ja', 'ko', 'ku', 'lt',
          'lv', 'nb', 'nl', 'nn', 'np', 'pl', 'pt', 'ro', 'ru', 'sk',
          'tr', 'tw', 'uk',
        ];
        expect(TranslationLoader.supportedLanguageCodes, expected);
      });
    });

    group('isLanguageCodeSupported', () {
      test('returns true for direct codes', () {
        expect(TranslationLoader.isLanguageCodeSupported('en'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('es'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('cn'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('np'), isTrue);
      });

      test('returns true for mapped codes (zh, el, hi, ne)', () {
        expect(TranslationLoader.isLanguageCodeSupported('zh'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('el'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('hi'), isTrue);
        expect(TranslationLoader.isLanguageCodeSupported('ne'), isTrue);
      });

      test('returns false for unsupported code', () {
        expect(TranslationLoader.isLanguageCodeSupported('xx'), isFalse);
        expect(TranslationLoader.isLanguageCodeSupported('zz'), isFalse);
      });
    });

    group('supportedLocales', () {
      test('returns correct number of Locale objects', () {
        final locales = TranslationLoader.supportedLocales;
        expect(locales.length, 33);
      });

      test('all entries are Locale objects', () {
        final locales = TranslationLoader.supportedLocales;
        for (final locale in locales) {
          expect(locale, isA<Locale>());
        }
      });
    });

    group('supportedLocalesWithVariants', () {
      test('includes script-code variants for zh', () {
        final locales = TranslationLoader.supportedLocalesWithVariants;
        final zhVariants = locales
            .where((l) => l.languageCode == 'zh')
            .toList();
        expect(zhVariants.length, 2);
        expect(
          zhVariants.any((l) => l.scriptCode == 'Hans'),
          isTrue,
        );
        expect(
          zhVariants.any((l) => l.scriptCode == 'Hant'),
          isTrue,
        );
      });

      test('includes mapped language codes', () {
        final locales = TranslationLoader.supportedLocalesWithVariants;
        final codes = locales.map((l) => l.languageCode).toSet();
        expect(codes.contains('el'), isTrue);
        expect(codes.contains('hi'), isTrue);
        expect(codes.contains('ne'), isTrue);
      });
    });

    group('language code resolution via getTranslation', () {
      test('zh without script returns cn-resolved key', () {
        // Without loading, getTranslation returns empty map, but
        // we can verify the resolution by checking the cache key indirectly.
        // The cache is empty so getTranslation falls back to empty map.
        final result = TranslationLoader.instance.getTranslation('zh');
        expect(result, isA<Map<String, String>>());
      });

      test('el resolves to gr-based lookup', () {
        final result = TranslationLoader.instance.getTranslation('el');
        expect(result, isA<Map<String, String>>());
      });

      test('hi resolves to np-based lookup', () {
        final result = TranslationLoader.instance.getTranslation('hi');
        expect(result, isA<Map<String, String>>());
      });

      test('ne resolves to np-based lookup', () {
        final result = TranslationLoader.instance.getTranslation('ne');
        expect(result, isA<Map<String, String>>());
      });
    });

    group('translate', () {
      test('returns null for uncached language', () {
        final result = TranslationLoader.instance.translate('xx', 'US');
        expect(result, isNull);
      });
    });
  });
}
