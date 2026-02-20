import 'controllers/country_selector.dart';

/// Represents a country with its relevant information.
class Country {
  /// The global provider for country data.
  static Country globalProvider = Country(
    phoneCode: '',
    countryCode: 'GL',
    e164Sc: -1,
    geographic: false,
    level: -1,
    name: 'Global',
    example: '',
    displayName: 'Global (GL)',
    displayNameNoCountryCode: 'Global',
    e164Key: '',
    capital: 'Global',
    language: 'gl',
    maxLength: 10,
    minLength: 10,
  );

  /// Capital city of the country.
  final String? capital;

  /// Primary language spoken in the country.
  final String? language;

  /// Currency information map.
  final Map? currency;

  /// Popular sports in the country.
  final List? popularSports;

  /// International calling code with plus sign (e.g., "+1").
  final String? callingCode;

  /// Primary time zone of the country.
  final String? timeZone;

  /// Geographic region (e.g., "Americas", "Europe").
  final String? region;

  /// Full phone example with plus sign prefix.
  final String? fullExampleWithPlusSign;

  /// Geographic subregion (e.g., "Northern America").
  final String? subregion;

  /// Demonym for residents of the country.
  final String? resident;

  /// Internet top-level domain (e.g., ".us").
  final String? internetTld;

  /// Flag emoji text representation.
  final String? flagEmojiText;

  /// Phone code without plus sign (e.g., "1" for US).
  final String phoneCode;

  /// ISO 3166-1 alpha-2 country code (e.g., "US").
  final String countryCode;

  /// E.164 standard country code.
  final int e164Sc;

  /// Whether this is a geographic entity.
  final bool geographic;

  /// Hierarchy level in the E.164 numbering plan.
  final int level;

  /// English name of the country.
  final String name;

  /// Localized name of the country (set after translation lookup).
  late String? nameLocalized;

  /// Example phone number for this country.
  final String example;

  /// Display name including country code (e.g., "United States (US) [+1]").
  final String displayName;

  /// Display name without E.164 country code.
  final String displayNameNoCountryCode;

  /// E.164 key for this country.
  final String e164Key;

  /// Maximum valid phone number length for this country.
  final int maxLength;

  /// Minimum valid phone number length for this country.
  final int minLength;

  /// Constructs a [Country] object.
  Country({
    required this.phoneCode,
    required this.countryCode,
    required this.e164Sc,
    required this.geographic,
    required this.level,
    required this.name,
    this.nameLocalized = '',
    required this.example,
    required this.displayName,
    required this.displayNameNoCountryCode,
    required this.e164Key,
    this.fullExampleWithPlusSign,
    required this.capital,
    required this.language,
    this.currency,
    this.popularSports,
    this.callingCode,
    this.timeZone,
    this.region,
    this.subregion,
    this.resident,
    this.internetTld,
    this.flagEmojiText,
    required this.maxLength,
    required this.minLength,
  });

  /// Constructs a [Country] object from JSON data.
  Country.from({required Map<String, dynamic> json})
    : phoneCode = json['e164_cc'],
      countryCode = json['iso2_cc'],
      e164Sc = json['e164_sc'],
      geographic = json['geographic'],
      level = json['level'],
      name = json['name'],
      example = json['example'],
      displayName = json['display_name'],
      fullExampleWithPlusSign = json['full_example_with_plus_sign'],
      displayNameNoCountryCode = json['display_name_no_e164_cc'],
      e164Key = json['e164_key'],
      capital = json['capital'],
      language = json['language'],
      currency = json['currency'],
      popularSports = json['popular_sports'],
      callingCode = json['calling_code'],
      timeZone = json['time_zone'],
      region = json['region'],
      subregion = json['subregion'],
      resident = json['demonym'],
      internetTld = json['internet_tld'],
      flagEmojiText = json['flag_emoji'],
      maxLength = json['max_length'],
      minLength = json['min_length'];

  /// Parses a country code and returns a [Country] object.
  static Country parse(String country) {
    if (country == globalProvider.countryCode) {
      return globalProvider;
    } else {
      return CountryDecoder.parse(country);
    }
  }

  /// Tries to parse a country code and returns a [Country] object if successful, otherwise returns null.
  static Country? tryParse(String country) {
    if (country == globalProvider.countryCode) {
      return globalProvider;
    } else {
      return CountryDecoder.tryParse(country);
    }
  }

  /// Converts the [Country] object to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['e164_cc'] = phoneCode;
    data['iso2_cc'] = countryCode;
    data['e164_sc'] = e164Sc;
    data['geographic'] = geographic;
    data['level'] = level;
    data['name'] = name;
    data['example'] = example;
    data['display_name'] = displayName;
    data['full_example_with_plus_sign'] = fullExampleWithPlusSign;
    data['flag_emoji'] = flagEmojiText;
    data['internet_tld'] = internetTld;
    data['demonym'] = resident;
    data['subregion'] = subregion;
    data['region'] = region;
    data['time_zone'] = timeZone;
    data['calling_code'] = callingCode;
    data['popular_sports'] = popularSports;
    data['currency'] = currency;
    data['language'] = language;
    data['capital'] = capital;
    data['display_name_no_e164_cc'] = displayNameNoCountryCode;
    data['e164_key'] = e164Key;
    data['max_length'] = maxLength;
    data['min_length'] = minLength;
    return data;
  }

  /// Checks if a string query matches the country's information.
  bool startsWith(String query, CountryLocalizations? localizations) {
    String query0 = query;
    if (query.startsWith('+')) {
      query0 = query.replaceAll('+', '').trim();
    }
    return phoneCode.startsWith(query0.toLowerCase()) ||
        name.toLowerCase().startsWith(query0.toLowerCase()) ||
        countryCode.toLowerCase().startsWith(query0.toLowerCase()) ||
        (localizations
                ?.countryName(countryCode: countryCode)
                ?.toLowerCase()
                .startsWith(query0.toLowerCase()) ??
            false);
  }

  /// Checks if the country represents the global entity.
  bool get iswWorldWide => countryCode == Country.globalProvider.countryCode;

  @override
  String toString() => 'Country(countryCode: $countryCode, name: $name)';

  @override
  bool operator ==(Object other) {
    if (other is Country) {
      return other.countryCode == countryCode;
    }

    return super == other;
  }

  @override
  int get hashCode => countryCode.hashCode;

  /// Retrieves the flag emoji of the country.
  String get flagEmoji => Util.countryCodeToEmoji(countryCode);
}
