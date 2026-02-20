import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('Country model', () {
    final sampleJson = <String, dynamic>{
      'e164_cc': '1',
      'iso2_cc': 'US',
      'e164_sc': 0,
      'geographic': true,
      'level': 1,
      'name': 'United States',
      'example': '2012345678',
      'display_name': 'United States (US) [+1]',
      'full_example_with_plus_sign': '+12012345678',
      'display_name_no_e164_cc': 'United States (US)',
      'e164_key': '1-US-0',
      'capital': 'Washington, D.C.',
      'language': 'English',
      'currency': {'name': 'US Dollar', 'code': 'USD', 'symbol': r'$'},
      'popular_sports': ['American Football', 'Basketball', 'Baseball'],
      'calling_code': '+1',
      'time_zone': 'UTC-5 to UTC-10',
      'region': 'Americas',
      'subregion': 'Northern America',
      'demonym': 'American',
      'internet_tld': '.us',
      'flag_emoji': '\u{1F1FA}\u{1F1F8}',
      'min_length': 10,
      'max_length': 10,
    };

    group('Country.from(json:)', () {
      test('creates Country from valid JSON', () {
        final country = Country.from(json: sampleJson);
        expect(country.phoneCode, equals('1'));
        expect(country.countryCode, equals('US'));
        expect(country.e164Sc, equals(0));
        expect(country.geographic, isTrue);
        expect(country.level, equals(1));
        expect(country.name, equals('United States'));
        expect(country.example, equals('2012345678'));
        expect(country.displayName, equals('United States (US) [+1]'));
        expect(country.displayNameNoCountryCode, equals('United States (US)'));
        expect(country.e164Key, equals('1-US-0'));
        expect(country.maxLength, equals(10));
        expect(country.minLength, equals(10));
      });

      test('sets optional fields from JSON', () {
        final country = Country.from(json: sampleJson);
        expect(country.capital, equals('Washington, D.C.'));
        expect(country.language, equals('English'));
        expect(country.currency, isNotNull);
        expect(country.popularSports, isNotNull);
        expect(country.callingCode, equals('+1'));
        expect(country.timeZone, equals('UTC-5 to UTC-10'));
        expect(country.region, equals('Americas'));
        expect(country.subregion, equals('Northern America'));
        expect(country.resident, equals('American'));
        expect(country.internetTld, equals('.us'));
        expect(country.flagEmojiText, isNotNull);
        expect(
          country.fullExampleWithPlusSign,
          equals('+12012345678'),
        );
      });
    });

    group('toJson', () {
      test('round-trips key fields through toJson', () {
        final country = Country.from(json: sampleJson);
        final json = country.toJson();

        expect(json['e164_cc'], equals('1'));
        expect(json['iso2_cc'], equals('US'));
        expect(json['e164_sc'], equals(0));
        expect(json['geographic'], isTrue);
        expect(json['level'], equals(1));
        expect(json['name'], equals('United States'));
        expect(json['example'], equals('2012345678'));
        expect(json['display_name'], equals('United States (US) [+1]'));
        expect(json['display_name_no_e164_cc'], equals('United States (US)'));
        expect(json['e164_key'], equals('1-US-0'));
        expect(json['max_length'], equals(10));
        expect(json['min_length'], equals(10));
      });

      test('toJson includes optional fields', () {
        final country = Country.from(json: sampleJson);
        final json = country.toJson();

        expect(json['capital'], equals('Washington, D.C.'));
        expect(json['language'], equals('English'));
        expect(json['currency'], isNotNull);
        expect(json['popular_sports'], isNotNull);
        expect(json['calling_code'], equals('+1'));
        expect(json['time_zone'], equals('UTC-5 to UTC-10'));
        expect(json['region'], equals('Americas'));
        expect(json['subregion'], equals('Northern America'));
        expect(json['demonym'], equals('American'));
        expect(json['internet_tld'], equals('.us'));
        expect(json['full_example_with_plus_sign'], equals('+12012345678'));
      });

      test('toJson produces valid JSON that can recreate the Country', () {
        final original = Country.from(json: sampleJson);
        final json = original.toJson();
        final restored = Country.from(json: json);

        expect(restored.countryCode, equals(original.countryCode));
        expect(restored.phoneCode, equals(original.phoneCode));
        expect(restored.name, equals(original.name));
        expect(restored.maxLength, equals(original.maxLength));
        expect(restored.minLength, equals(original.minLength));
      });
    });

    group('toString', () {
      test('returns formatted string', () {
        final country = Country.from(json: sampleJson);
        expect(
          country.toString(),
          equals('Country(countryCode: US, name: United States)'),
        );
      });
    });

    group('equality', () {
      test('two countries with same countryCode are equal', () {
        final a = Country.from(json: sampleJson);
        final b = Country.from(json: sampleJson);
        expect(a, equals(b));
      });

      test('two countries with different countryCode are not equal', () {
        final a = Country.from(json: sampleJson);
        final otherJson = Map<String, dynamic>.from(sampleJson);
        otherJson['iso2_cc'] = 'GB';
        final b = Country.from(json: otherJson);
        expect(a, isNot(equals(b)));
      });

      test('not equal to non-Country object', () {
        final country = Country.from(json: sampleJson);
        // ignore: unrelated_type_equality_checks
        expect(country == 'US', isFalse);
      });

      test('hashCode is based on countryCode', () {
        final a = Country.from(json: sampleJson);
        final b = Country.from(json: sampleJson);
        expect(a.hashCode, equals(b.hashCode));
      });
    });

    group('globalProvider', () {
      test('has countryCode GL', () {
        expect(Country.globalProvider.countryCode, equals('GL'));
      });

      test('has name Global', () {
        expect(Country.globalProvider.name, equals('Global'));
      });

      test('is not geographic', () {
        expect(Country.globalProvider.geographic, isFalse);
      });
    });

    group('iswWorldWide', () {
      test('returns true for globalProvider', () {
        expect(Country.globalProvider.iswWorldWide, isTrue);
      });

      test('returns false for regular country', () {
        final country = Country.from(json: sampleJson);
        expect(country.iswWorldWide, isFalse);
      });
    });

    group('flagEmoji', () {
      test('generates flag emoji from country code', () {
        final country = Country.from(json: sampleJson);
        final emoji = country.flagEmoji;
        expect(emoji, isNotEmpty);
        // US flag emoji is two Unicode characters (regional indicator symbols)
        expect(emoji.runes.length, equals(2));
      });
    });

    group('startsWith', () {
      test('matches by phone code', () {
        final country = Country.from(json: sampleJson);
        expect(country.startsWith('1', null), isTrue);
      });

      test('matches by name prefix (case insensitive)', () {
        final country = Country.from(json: sampleJson);
        expect(country.startsWith('United', null), isTrue);
        expect(country.startsWith('united', null), isTrue);
      });

      test('matches by country code prefix', () {
        final country = Country.from(json: sampleJson);
        expect(country.startsWith('US', null), isTrue);
        expect(country.startsWith('us', null), isTrue);
      });

      test('strips + prefix from query', () {
        final country = Country.from(json: sampleJson);
        expect(country.startsWith('+1', null), isTrue);
      });

      test('does not match unrelated query', () {
        final country = Country.from(json: sampleJson);
        expect(country.startsWith('Germany', null), isFalse);
      });
    });

    group('Country.parse', () {
      test('returns globalProvider for GL code', () {
        final country = Country.parse('GL');
        expect(country, same(Country.globalProvider));
      });

      test('delegates to CountryDecoder for non-GL code', () {
        final country = Country.parse('US');
        expect(country.countryCode, equals('US'));
      });
    });

    group('Country.tryParse', () {
      test('returns globalProvider for GL code', () {
        final country = Country.tryParse('GL');
        expect(country, same(Country.globalProvider));
      });

      test('returns Country for valid code', () {
        final country = Country.tryParse('FR');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('FR'));
      });

      test('returns null for invalid code', () {
        final country = Country.tryParse('ZZZZZ');
        expect(country, isNull);
      });
    });

    group('named constructor', () {
      test('creates Country with all required fields', () {
        final country = Country(
          phoneCode: '52',
          countryCode: 'MX',
          e164Sc: 0,
          geographic: true,
          level: 1,
          name: 'Mexico',
          example: '2221234567',
          displayName: 'Mexico (MX) [+52]',
          displayNameNoCountryCode: 'Mexico (MX)',
          e164Key: '52-MX-0',
          capital: 'Mexico City',
          language: 'Spanish',
          maxLength: 10,
          minLength: 10,
        );

        expect(country.phoneCode, equals('52'));
        expect(country.countryCode, equals('MX'));
        expect(country.name, equals('Mexico'));
        expect(country.capital, equals('Mexico City'));
      });

      test('nameLocalized defaults to empty string', () {
        final country = Country(
          phoneCode: '52',
          countryCode: 'MX',
          e164Sc: 0,
          geographic: true,
          level: 1,
          name: 'Mexico',
          example: '2221234567',
          displayName: 'Mexico (MX) [+52]',
          displayNameNoCountryCode: 'Mexico (MX)',
          e164Key: '52-MX-0',
          capital: 'Mexico City',
          language: 'Spanish',
          maxLength: 10,
          minLength: 10,
        );

        expect(country.nameLocalized, equals(''));
      });
    });
  });
}
