import 'package:flutter/material.dart';

import 'translation_loader.dart';

/// Provides localized country names based on the current [Locale].
class CountryLocalizations {
  /// The locale used for translation lookups.
  final Locale locale;

  /// Creates a [CountryLocalizations] for the given [locale].
  CountryLocalizations(this.locale);

  /// Returns the [CountryLocalizations] from the nearest [Localizations] ancestor.
  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  /// [LocalizationsDelegate] for registering [CountryLocalizations].
  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  /// Returns the localized country name for the given [countryCode].
  String? countryName({required String countryCode}) {
    return TranslationLoader.instance.translate(
          locale.languageCode,
          countryCode,
          scriptCode: locale.scriptCode,
        ) ??
        countryCode;
  }
}

// Delegate for CountryLocalizations
class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  // Check if the locale is supported
  @override
  bool isSupported(Locale locale) {
    return TranslationLoader.isLanguageCodeSupported(locale.languageCode);
  }

  // Load the CountryLocalizations based on the locale
  @override
  Future<CountryLocalizations> load(Locale locale) async {
    await TranslationLoader.instance.load(
      locale.languageCode,
      scriptCode: locale.scriptCode,
    );
    return CountryLocalizations(locale);
  }

  // Check if the delegate should reload
  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
