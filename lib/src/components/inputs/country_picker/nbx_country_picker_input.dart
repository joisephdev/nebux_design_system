import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxCountryPickerInput extends StatelessWidget {
  final bool isRequired;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final NbxInputType inputType;
  final NbxFormType formType;
  final String labelText;
  final String hintText;
  final String requiredErrorMessage;
  final TextEditingController controller;
  final void Function(Country) onSelect;

  /// Constructor for the [NbxCountryPickerInput] widget.
  ///
  /// @param formType: The form type for the input field [NbxFormType].
  /// @param isRequired: Whether the input field is required [bool].
  /// @param prefixIcon: The prefix icon for the input field [Widget].
  /// @param suffixIcon: The suffix icon for the input field [Widget].
  /// @param inputType: The type of input field from Nebux design system [NbxInputType].
  /// @param controller: The text editing controller for the input field [TextEditingController].
  /// @param labelText: The label text for the input field [String].
  /// @param hintText: The hint text for the input field [String].
  /// @param requiredErrorMessage: The required error message for the input field [String].
  /// @param onSelect: The on select callback for the input field [void Function(Country)].
  const NbxCountryPickerInput({
    super.key,
    required this.formType,
    required this.isRequired,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.inputType,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.requiredErrorMessage,
    required this.onSelect,
  });

  /// Builds the country picker input widget.
  ///
  /// @param context: The build context for the widget [BuildContext].
  ///
  /// @returns: A configured [NbxTextFormFieldWidget] for country selection [Widget].
  @override
  Widget build(BuildContext context) {
    return NbxTextFormFieldWidget(
      NbxInputParameters(
        context: context,
        isReadOnly: true,
        isRequired: isRequired,
        inputType: inputType,
        controller: controller,
        autoDisposeController: false,
        formType: formType,
        forceShowSuffixIcon: true,
        labelText: labelText,
        hintText: hintText,
        requiredErrorMessage: requiredErrorMessage,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: suffixIcon,
        ),
        onTap: () => _openCountryPicker(context),
      ),
    );
  }

  void _openCountryPicker(BuildContext context) {
    CountrySelector(
      context: context,
      countryPreferred: <String>['US'],
      showPhoneCode: true,
      appBarTitle: 'Select Country',
      onSelect: onSelect,
      listType: ListType.list,
      appBarBackgroundColour: Colors.black,
      appBarFontSize: 20,
      appBarFontStyle: FontStyle.normal,
      appBarFontWeight: FontWeight.bold,
      appBarTextColour: Colors.white,
      appBarTextCenterAlign: true,
      backgroundColour: Colors.white,
      backIcon: Icons.arrow_back,
      backIconColour: Colors.white,
      countryFontStyle: FontStyle.normal,
      countryFontWeight: FontWeight.bold,
      countryTextColour: Colors.black,
      countryTitleSize: 16,
      dividerColour: Colors.black12,
      searchBarAutofocus: true,
      searchBarIcon: Icons.search,
      searchBarBackgroundColor: Colors.white,
      searchBarBorderColor: Colors.black,
      searchBarBorderWidth: 2,
      searchBarOuterBackgroundColor: Colors.white,
      searchBarTextColor: Colors.black,
      searchBarHintColor: Colors.black,
      countryTheme: const CountryThemeData(appBarBorderRadius: 10),
      showSearchBox: true,
    );
  }
}
