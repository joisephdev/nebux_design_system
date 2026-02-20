import 'package:flutter/material.dart';

import 'translation_loader.dart';

// Class for handling country localizations
class CountryLocalizations {
  final Locale locale;

  // Constructor
  CountryLocalizations(this.locale);

  // Static method for getting localized resources
  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  // LocalizationsDelegate for CountryLocalizations
  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  // Method for retrieving country name based on country code
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
