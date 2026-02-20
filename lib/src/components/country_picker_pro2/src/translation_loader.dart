import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TranslationLoader {
  TranslationLoader._();
  static final TranslationLoader instance = TranslationLoader._();

  final Map<String, Map<String, String>> _cache = {};

  static const List<String> supportedLanguageCodes = [
    'ar', 'bg', 'ca', 'cn', 'cs', 'de', 'en', 'es', 'et', 'fr',
    'gr', 'he', 'hr', 'ht', 'id', 'it', 'ja', 'ko', 'ku', 'lt',
    'lv', 'nb', 'nl', 'nn', 'np', 'pl', 'pt', 'ro', 'ru', 'sk',
    'tr', 'tw', 'uk',
  ];

  String _resolveLanguageCode(String languageCode, {String? scriptCode}) {
    if (languageCode == 'zh') {
      if (scriptCode == 'Hant') return 'tw';
      return 'cn';
    }
    if (languageCode == 'el') return 'gr';
    if (languageCode == 'hi' || languageCode == 'ne') return 'np';
    return languageCode;
  }

  Future<void> load(String languageCode, {String? scriptCode}) async {
    final resolved = _resolveLanguageCode(languageCode, scriptCode: scriptCode);
    if (_cache.containsKey(resolved)) return;
    try {
      final jsonString = await rootBundle.loadString(
        'packages/nebux_design_system/assets/translations/$resolved.json',
      );
      final Map<String, dynamic> decoded = json.decode(jsonString);
      _cache[resolved] = decoded.map((k, v) => MapEntry(k, v.toString()));
    } catch (_) {
      if (resolved != 'en') {
        await load('en');
      }
    }
  }

  Map<String, String> getTranslation(
    String languageCode, {
    String? scriptCode,
  }) {
    final resolved = _resolveLanguageCode(languageCode, scriptCode: scriptCode);
    return _cache[resolved] ?? _cache['en'] ?? {};
  }

  String? translate(
    String languageCode,
    String countryCode, {
    String? scriptCode,
  }) {
    final translations = getTranslation(
      languageCode,
      scriptCode: scriptCode,
    );
    return translations[countryCode];
  }

  /// Language codes that map to a different file-based code.
  static const List<String> _mappedLanguageCodes = ['zh', 'hi', 'ne', 'el'];

  /// Whether [languageCode] is supported, either directly or via mapping.
  static bool isLanguageCodeSupported(String languageCode) {
    return supportedLanguageCodes.contains(languageCode) ||
        _mappedLanguageCodes.contains(languageCode);
  }

  static List<Locale> get supportedLocales =>
      supportedLanguageCodes.map((code) => Locale(code)).toList();

  /// Locales including script-code variants for languages that map to
  /// different translation files (e.g. zh-Hans → cn, zh-Hant → tw).
  static List<Locale> get supportedLocalesWithVariants {
    final locales = supportedLanguageCodes
        .map((code) => Locale(code))
        .toList();
    // Add mapped language codes as simple locales
    for (final code in _mappedLanguageCodes) {
      if (code == 'zh') {
        locales.add(
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        );
        locales.add(
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        );
      } else {
        locales.add(Locale(code));
      }
    }
    return locales;
  }
}
