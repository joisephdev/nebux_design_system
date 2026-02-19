import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxCountryPickerInput extends StatelessWidget {
  /// @param inputParameters: The input parameters [NbxCountryPickerParameters].
  final NbxCountryPickerParameters inputParameters;

  /// @param modal: The modal/list configuration parameters [NbxCountryPickerModalParameters].
  final NbxCountryPickerModalParameters modal;

  /// @param onBeforeOpen: Callback to validate if the picker should open.
  /// Returns true to open, false to prevent opening. If null, it opens by default.
  final Future<bool> Function()? onBeforeOpen;

  /// Whether to show the error text inside the input field.
  final bool showErrorText;

  /// Pure validator for the input field (native Flutter contract).
  final String? Function(String?)? validator;

  /// Notification callback: called with the final error after validation (null = valid).
  final void Function(String?)? onValidationResult;

  /// Custom border overrides for the input field.
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;

  /// Constructor for the [NbxCountryPickerInput] widget.
  const NbxCountryPickerInput({
    super.key,
    required this.inputParameters,
    required this.modal,
    this.onBeforeOpen,
    this.showErrorText = true,
    this.validator,
    this.onValidationResult,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
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
        maxLines: inputParameters.maxLines,
        isRequired: inputParameters.isRequired,
        inputType: inputParameters.inputType,
        controller: inputParameters.controller,
        decorationStyle: inputParameters.decorationStyle,
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
        showErrorText: showErrorText,
        validator: validator,
        onValidationResult: onValidationResult,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        border: border,
      ),
    );
  }

  Future<void> _openCountryPicker(BuildContext context) async {
    if (onBeforeOpen != null && !await onBeforeOpen!()) {
      return;
    }

    if (!context.mounted) return;

    final colors = context.nebuxTheme.colors;
    countrySelector(
      context: context,
      countries: modal.countries,
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
