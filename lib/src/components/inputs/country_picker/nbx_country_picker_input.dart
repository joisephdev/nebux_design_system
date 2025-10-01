import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxCountryPickerInput extends StatelessWidget {
  /// @param inputParameters: The input parameters [NbxCountryPickerParameters].
  final NbxCountryPickerParameters inputParameters;

  /// @param modal: The modal/list configuration parameters [NbxCountryPickerModalParameters].
  final NbxCountryPickerModalParameters modal;

  /// Constructor for the [NbxCountryPickerInput] widget.
  const NbxCountryPickerInput({
    super.key,
    required this.inputParameters,
    required this.modal,
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
        autoDisposeController: false,
        forceShowSuffixIcon: true,
        isRequired: inputParameters.isRequired,
        inputType: inputParameters.inputType,
        controller: inputParameters.controller,
        formType: inputParameters.formType,
        labelText: inputParameters.labelText,
        hintText: inputParameters.hintText,
        requiredErrorMessage: inputParameters.requiredErrorMessage,
        prefixIcon: inputParameters.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 12),
                child: inputParameters.prefixIcon,
              )
            : null,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: context.nebuxTheme.colors.primary,
          ),
        ),
        onTap: () => _openCountryPicker(context),
      ),
    );
  }

  void _openCountryPicker(BuildContext context) {
    final colors = context.nebuxTheme.colors;
    countrySelector(
      context: context,
      countryPreferred: modal.preferredCountries,
      showPhoneCode: modal.showPhoneCode,
      appBarTitle: modal.appBarTitle,
      onSelect: modal.onSelect,
      listType: modal.listType,
      appBarBackgroundColour: modal.appBarBackgroundColour ?? colors.primary,
      appBarFontSize: modal.appBarFontSize,
      appBarFontStyle: modal.appBarFontStyle,
      appBarFontWeight: modal.appBarFontWeight,
      appBarTextColour: modal.appBarTextColour,
      appBarTextCenterAlign: modal.appBarTextCenterAlign,
      backgroundColour: modal.backgroundColour,
      backIcon: modal.backIcon,
      backIconColour: modal.backIconColour,
      countryFontStyle: modal.countryFontStyle,
      countryFontWeight: modal.countryFontWeight,
      countryTextColour: modal.countryTextColour ?? colors.secondary,
      countryTitleSize: modal.countryTitleSize,
      dividerColour: modal.dividerColour,
      searchBarAutofocus: modal.searchBarAutofocus,
      searchBarIcon: modal.searchBarIcon,
      searchBarBackgroundColor: modal.searchBarBackgroundColor,
      searchBarBorderColor: modal.searchBarBorderColor ?? colors.secondary,
      searchBarBorderWidth: modal.searchBarBorderWidth,
      searchBarOuterBackgroundColor: modal.searchBarOuterBackgroundColor,
      searchBarTextColor: modal.searchBarTextColor ?? colors.secondary,
      searchBarHintColor: modal.searchBarHintColor ?? colors.secondary,
      countryTheme: modal.countryTheme,
      showSearchBox: modal.showSearchBox,
    );
  }
}
