import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('CountryPickerSearchConfig', () {
    test('all fields default to null', () {
      const config = CountryPickerSearchConfig();
      expect(config.backgroundColor, isNull);
      expect(config.textColor, isNull);
      expect(config.borderColor, isNull);
      expect(config.borderWidth, isNull);
      expect(config.hintColor, isNull);
      expect(config.icon, isNull);
      expect(config.outerBackgroundColor, isNull);
      expect(config.hintText, isNull);
      expect(config.cursorColor, isNull);
    });

    test('all fields can be set via constructor', () {
      const config = CountryPickerSearchConfig(
        backgroundColor: Colors.white,
        textColor: Colors.black,
        borderColor: Colors.grey,
        borderWidth: 2.0,
        hintColor: Colors.grey,
        icon: Icon(Icons.search),
        outerBackgroundColor: Colors.blue,
        hintText: 'Search...',
        cursorColor: Colors.red,
      );
      expect(config.backgroundColor, Colors.white);
      expect(config.textColor, Colors.black);
      expect(config.borderColor, Colors.grey);
      expect(config.borderWidth, 2.0);
      expect(config.hintColor, Colors.grey);
      expect(config.icon, isNotNull);
      expect(config.outerBackgroundColor, Colors.blue);
      expect(config.hintText, 'Search...');
      expect(config.cursorColor, Colors.red);
    });
  });

  group('CountryPickerAppBarConfig', () {
    test('centerAlign defaults to true, others to null', () {
      const config = CountryPickerAppBarConfig();
      expect(config.centerAlign, isTrue);
      expect(config.backgroundColor, isNull);
      expect(config.textColor, isNull);
      expect(config.fontSize, isNull);
      expect(config.fontWeight, isNull);
      expect(config.fontStyle, isNull);
      expect(config.backIcon, isNull);
      expect(config.backIconColor, isNull);
      expect(config.title, isNull);
    });

    test('all fields can be set via constructor', () {
      const config = CountryPickerAppBarConfig(
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        centerAlign: false,
        backIcon: Icon(Icons.arrow_back),
        backIconColor: Colors.red,
        title: 'Select Country',
      );
      expect(config.backgroundColor, Colors.white);
      expect(config.textColor, Colors.black);
      expect(config.fontSize, 18.0);
      expect(config.fontWeight, FontWeight.bold);
      expect(config.fontStyle, FontStyle.italic);
      expect(config.centerAlign, isFalse);
      expect(config.backIcon, isNotNull);
      expect(config.backIconColor, Colors.red);
      expect(config.title, 'Select Country');
    });
  });

  group('CountryPickerStyleConfig', () {
    test('shape defaults to BoxShape.rectangle, others to null', () {
      const config = CountryPickerStyleConfig();
      expect(config.shape, BoxShape.rectangle);
      expect(config.flagSize, isNull);
      expect(config.flagBorderWidth, isNull);
      expect(config.flagBorderColor, isNull);
      expect(config.countryFontSize, isNull);
      expect(config.countryFontWeight, isNull);
      expect(config.dialCodeFontSize, isNull);
      expect(config.dialCodeFontWeight, isNull);
      expect(config.countryFontColor, isNull);
      expect(config.dialCodeFontColor, isNull);
    });

    test('all fields can be set via constructor', () {
      const config = CountryPickerStyleConfig(
        flagSize: 32.0,
        flagBorderWidth: 1.0,
        flagBorderColor: Colors.grey,
        countryFontSize: 16.0,
        countryFontWeight: FontWeight.w600,
        dialCodeFontSize: 14.0,
        dialCodeFontWeight: FontWeight.w400,
        countryFontColor: Colors.black,
        dialCodeFontColor: Colors.grey,
        shape: BoxShape.circle,
      );
      expect(config.flagSize, 32.0);
      expect(config.flagBorderWidth, 1.0);
      expect(config.flagBorderColor, Colors.grey);
      expect(config.countryFontSize, 16.0);
      expect(config.countryFontWeight, FontWeight.w600);
      expect(config.dialCodeFontSize, 14.0);
      expect(config.dialCodeFontWeight, FontWeight.w400);
      expect(config.countryFontColor, Colors.black);
      expect(config.dialCodeFontColor, Colors.grey);
      expect(config.shape, BoxShape.circle);
    });
  });
}
