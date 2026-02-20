import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  late CountryProvider provider;

  setUp(() {
    provider = CountryProvider();
  });

  group('CountryProvider', () {
    group('getAll', () {
      test('returns a non-empty list of countries', () {
        final countries = provider.getAll();
        expect(countries, isNotEmpty);
      });

      test('all entries are Country objects', () {
        final countries = provider.getAll();
        for (final country in countries) {
          expect(country, isA<Country>());
        }
      });

      test('contains well-known countries', () {
        final countries = provider.getAll();
        final codes = countries.map((c) => c.countryCode).toSet();
        expect(codes.contains('US'), isTrue);
        expect(codes.contains('GB'), isTrue);
        expect(codes.contains('DE'), isTrue);
        expect(codes.contains('JP'), isTrue);
        expect(codes.contains('BR'), isTrue);
      });
    });

    group('findByCode', () {
      test('finds US by code', () {
        final country = provider.findByCode('US');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('US'));
        expect(country.name, equals('United States'));
      });

      test('finds country with lowercase code (case insensitive)', () {
        final country = provider.findByCode('us');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('US'));
      });

      test('returns null for unknown code', () {
        final country = provider.findByCode('ZZ');
        expect(country, isNull);
      });

      test('returns null for null input', () {
        final country = provider.findByCode(null);
        expect(country, isNull);
      });

      test('returns null for empty string', () {
        final country = provider.findByCode('');
        expect(country, isNull);
      });

      test('finds GB (United Kingdom)', () {
        final country = provider.findByCode('GB');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('GB'));
      });
    });

    group('findByName', () {
      test('finds country by exact name', () {
        final country = provider.findByName('United States');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('US'));
      });

      test('returns null for unknown name', () {
        final country = provider.findByName('Atlantis');
        expect(country, isNull);
      });

      test('returns null for null input', () {
        final country = provider.findByName(null);
        expect(country, isNull);
      });

      test('is case-sensitive', () {
        final country = provider.findByName('united states');
        expect(country, isNull);
      });

      test('finds Germany by name', () {
        final country = provider.findByName('Germany');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('DE'));
      });

      test('finds Japan by name', () {
        final country = provider.findByName('Japan');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('JP'));
      });
    });

    group('findByPhoneCode', () {
      test('finds US by phone code 1', () {
        final country = provider.findByPhoneCode('1');
        expect(country, isNotNull);
        expect(country!.phoneCode, equals('1'));
      });

      test('finds UK by phone code 44', () {
        final country = provider.findByPhoneCode('44');
        expect(country, isNotNull);
        expect(country!.phoneCode, equals('44'));
      });

      test('finds Germany by phone code 49', () {
        final country = provider.findByPhoneCode('49');
        expect(country, isNotNull);
        expect(country!.countryCode, equals('DE'));
      });

      test('returns null for unknown phone code', () {
        final country = provider.findByPhoneCode('99999');
        expect(country, isNull);
      });
    });

    group('getCountriesByCodes', () {
      test('returns matching countries', () {
        final countries = provider.getCountriesByCodes(['US', 'GB', 'DE']);
        expect(countries.length, equals(3));
        final codes = countries.map((c) => c.countryCode).toSet();
        expect(codes, containsAll(['US', 'GB', 'DE']));
      });

      test('returns empty list for empty input', () {
        final countries = provider.getCountriesByCodes([]);
        expect(countries, isEmpty);
      });

      test('ignores unknown codes', () {
        final countries = provider.getCountriesByCodes(['US', 'ZZ']);
        expect(countries.length, equals(1));
        expect(countries.first.countryCode, equals('US'));
      });

      test('handles all unknown codes', () {
        final countries = provider.getCountriesByCodes(['ZZ', 'YY']);
        expect(countries, isEmpty);
      });
    });

    group('findCountriesByCode', () {
      test('returns matching countries with case insensitivity', () {
        final countries = provider.findCountriesByCode(['us', 'gb']);
        expect(countries.length, equals(2));
      });

      test('returns empty list for no matches', () {
        final countries = provider.findCountriesByCode(['ZZ']);
        expect(countries, isEmpty);
      });

      test('returns empty list for empty input', () {
        final countries = provider.findCountriesByCode([]);
        expect(countries, isEmpty);
      });
    });
  });
}
