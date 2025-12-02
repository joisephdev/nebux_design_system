import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

part 'nbx_country_picker_parameters.freezed.dart';

@Freezed()
abstract class NbxCountryPickerParameters with _$NbxCountryPickerParameters {
  @Assert(
    'isRequired == true && requiredErrorMessage != null || isRequired == false',
    'The message is necessary for required fields',
  )
  factory NbxCountryPickerParameters({
    required bool isRequired,
    required NbxInputType inputType,
    required NbxInputDecorationStyle decorationStyle,
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    String? requiredErrorMessage,
    Widget? prefixIcon,
    int? maxLines,
  }) = _NbxCountryPickerParameters;
}

/// This class defines the modal/list configuration for the country selector dialog.
@Freezed()
abstract class NbxCountryPickerModalParameters
    with _$NbxCountryPickerModalParameters {
  factory NbxCountryPickerModalParameters({
    required String appBarTitle,
    Color? countryTextColour,
    Color? appBarBackgroundColour,
    Color? searchBarBorderColor,
    Color? searchBarTextColor,
    Color? searchBarHintColor,
    @Default(Colors.white) Color backgroundColour,
    @Default(Colors.white) Color appBarTextColour,
    @Default(Colors.white) Color backIconColour,
    @Default(Colors.black12) Color dividerColour,
    @Default(Colors.white) Color searchBarBackgroundColor,
    @Default(Colors.white) Color searchBarOuterBackgroundColor,
    @Default(FontStyle.normal) FontStyle appBarFontStyle,
    @Default(FontStyle.normal) FontStyle countryFontStyle,
    @Default(20) double appBarFontSize,
    @Default(16) double countryTitleSize,
    @Default(.5) double searchBarBorderWidth,
    @Default(true) bool appBarTextCenterAlign,
    @Default(false) bool searchBarAutofocus,
    @Default(true) bool showSearchBox,
    @Default(false) bool showPhoneCode,
    @Default(FontWeight.bold) FontWeight appBarFontWeight,
    @Default(FontWeight.bold) FontWeight? countryFontWeight,
    @Default(Icons.arrow_back) IconData backIcon,
    @Default(Icons.search) IconData searchBarIcon,
    @Default(ListType.list) ListType listType,
    @Default(CountryThemeData(appBarBorderRadius: 10))
    CountryThemeData countryTheme,
    List<Country>? countries,
    required void Function(Country) onSelect,
  }) = _NbxCountryPickerModalParameters;
}
