import 'package:flutter/material.dart';

import 'controllers/country_selector.dart';
import 'res/country_json.dart';
import 'translation_loader.dart';

/// Decodes country information from country codes, phone codes, or names.
class CountryDecoder {
  /// Parses a [Country] from a country code or name. Throws if not found.
  static Country parse(String country) {
    return tryParseCountryCode(country) ?? parseCountryName(country);
  }

  /// Tries to parse a [Country] from a country code or name. Returns null if not found.
  static Country? tryParse(String country) {
    return tryParseCountryCode(country) ?? tryParseCountryName(country);
  }

  /// Parses a [Country] from an ISO 3166-1 alpha-2 country code.
  static Country parseCountryCode(String countryCode) {
    return _getFromCode(countryCode.toUpperCase());
  }

  /// Parses a [Country] from a phone/dial code.
  static Country parsePhoneCode(String phoneCode) {
    return _getFromPhoneCode(phoneCode);
  }

  /// Tries to parse a [Country] from a country code. Returns null on failure.
  static Country? tryParseCountryCode(String countryCode) {
    try {
      return parseCountryCode(countryCode);
    } catch (_) {
      return null;
    }
  }

  /// Tries to parse a [Country] from a phone code. Returns null on failure.
  static Country? tryParsePhoneCode(String phoneCode) {
    try {
      return parsePhoneCode(phoneCode);
    } catch (_) {
      return null;
    }
  }

  /// Parses a [Country] from a localized or English country name.
  static Country parseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    final String countryNameLower = countryName.toLowerCase();

    final CountryLocalizations? localizations = context != null
        ? CountryLocalizations.of(context)
        : null;

    final String languageCode = _anyLocalizedNameToCode(
      countryNameLower,
      localizations?.locale,
      locales,
    );

    return _getFromCode(languageCode);
  }

  /// Tries to parse a [Country] from a country name. Returns null on failure.
  static Country? tryParseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    try {
      return parseCountryName(countryName, context: context, locales: locales);
    } catch (_) {
      return null;
    }
  }

  static Country _getFromPhoneCode(String phoneCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['e164_cc'] == phoneCode,
      ),
    );
  }

  static Country _getFromCode(String countryCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['iso2_cc'] == countryCode,
      ),
    );
  }

  static String _anyLocalizedNameToCode(
    String name,
    Locale? locale,
    List<Locale>? locales,
  ) {
    String? code;

    if (locale != null) code = _localizedNameToCode(name, locale);
    if (code == null && locales == null) {
      code = _localizedNameToCode(name, const Locale('en'));
    }
    if (code != null) return code;

    final List<Locale> localeList = locales ?? <Locale>[];

    if (locales == null) {
      final List<Locale> exclude = <Locale>[const Locale('en')];
      if (locale != null) exclude.add(locale);
      localeList.addAll(_supportedLanguages(exclude: exclude));
    }

    return _nameToCodeFromGivenLocales(name, localeList);
  }

  static String _nameToCodeFromGivenLocales(String name, List<Locale> locales) {
    String? code;

    for (int i = 0; i < locales.length && code == null; i++) {
      code = _localizedNameToCode(name, locales[i]);
    }

    if (code == null) {
      throw ArgumentError.value('No country found');
    }

    return code;
  }

  static String? _localizedNameToCode(String name, Locale locale) {
    final Map<String, String> translation = _getTranslation(locale);

    String? code;

    translation.forEach((key, value) {
      if (value.toLowerCase() == name) code = key;
    });

    return code;
  }

  static Map<String, String> _getTranslation(Locale locale) {
    return TranslationLoader.instance.getTranslation(
      locale.languageCode,
      scriptCode: locale.scriptCode,
    );
  }

  static List<Locale> _supportedLanguages({
    List<Locale> exclude = const <Locale>[],
  }) {
    return TranslationLoader.supportedLocalesWithVariants
      ..removeWhere((Locale l) => exclude.contains(l));
  }
}
