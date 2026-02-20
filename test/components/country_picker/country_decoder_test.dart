import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('CountryDecoder', () {
    group('parseCountryCode', () {
      test('parses US country code', () {
        final country = CountryDecoder.parseCountryCode('US');
        expect(country.countryCode, equals('US'));
        expect(country.name, equals('United States'));
      });

      test('parses lowercase country code', () {
        final country = CountryDecoder.parseCountryCode('gb');
        expect(country.countryCode, equals('GB'));
      });

      test('throws for invalid country code', () {
        expect(
          () => CountryDecoder.parseCountryCode('ZZ'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('tryParseCountryCode', () {
      test('returns Country for valid code', () {
        final country = CountryDecoder.tryParseCountryCode('DE');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('DE'));
      });

      test('returns null for invalid code', () {
        final country = CountryDecoder.tryParseCountryCode('ZZ');
        expect(country, isNull);
      });

      test('returns null for empty string', () {
        final country = CountryDecoder.tryParseCountryCode('');
        expect(country, isNull);
      });
    });

    group('parsePhoneCode', () {
      test('parses phone code 49 (DE)', () {
        final country = CountryDecoder.parsePhoneCode('49');
        expect(country.phoneCode, equals('49'));
        expect(country.countryCode, equals('DE'));
      });

      test('parses phone code 81 (JP)', () {
        final country = CountryDecoder.parsePhoneCode('81');
        expect(country.countryCode, equals('JP'));
      });

      test('throws for invalid phone code', () {
        expect(
          () => CountryDecoder.parsePhoneCode('99999'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('tryParsePhoneCode', () {
      test('returns Country for valid phone code', () {
        final country = CountryDecoder.tryParsePhoneCode('33');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('FR'));
      });

      test('returns null for invalid phone code', () {
        final country = CountryDecoder.tryParsePhoneCode('99999');
        expect(country, isNull);
      });
    });

    group('parse', () {
      test('parses a valid country code', () {
        final country = CountryDecoder.parse('US');
        expect(country.countryCode, equals('US'));
      });

      test('parses lowercase country code', () {
        final country = CountryDecoder.parse('jp');
        expect(country.countryCode, equals('JP'));
      });

      test('throws for completely invalid input', () {
        expect(
          () => CountryDecoder.parse('ZZZZZ'),
          throwsA(anything),
        );
      });
    });

    group('tryParse', () {
      test('returns Country for valid code', () {
        final country = CountryDecoder.tryParse('FR');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('FR'));
      });

      test('returns null for invalid input', () {
        final country = CountryDecoder.tryParse('ZZZZZ');
        expect(country, isNull);
      });

      test('returns null for empty string', () {
        final country = CountryDecoder.tryParse('');
        expect(country, isNull);
      });
    });
  });
}
