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

  /// Constructor for the [NbxCountryPickerInput] widget.
  ///
  /// @param isRequired: Whether the input field is required [bool].
  /// @param inputType: The type of input field from Nebux design system [NbxInputType].
  /// @param controller: The text editing controller for the input field [TextEditingController].
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
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 12),
          child: suffixIcon,
        ),
        labelText: labelText,
        hintText: hintText,
        requiredErrorMessage: requiredErrorMessage,
      ),
    );
  }
}
