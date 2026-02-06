import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A widget that combines a country picker and phone number input field.
///
/// This widget provides a user-friendly interface for selecting a country
/// and entering a phone number, with automatic validation and state management.
class NbxPhoneFieldWidget extends StatefulWidget {
  /// The currently selected country [Country?].
  final Country? countrySelected;

  /// The country code input parameters [NbxCountryPickerParameters].
  final NbxCountryPickerParameters countryCodeInputParameters;

  /// The number phone input parameters [NbxInputParameters].
  final NbxInputParameters phoneNumberInputParameters;

  /// The modal/list configuration parameters [NbxCountryPickerModalParameters].
  final NbxCountryPickerModalParameters modal;

  /// Constructor for the [NbxPhoneFieldWidget] widget.
  ///
  /// @param countrySelected: The currently selected country [Country?].
  /// @param countryCodeInputParameters: Configuration for the country picker input [NbxCountryPickerParameters].
  /// @param numberPhoneInputParameters: Configuration for the phone number input [NbxInputParameters].
  /// @param modal: Configuration for the country picker modal [NbxCountryPickerModalParameters].
  const NbxPhoneFieldWidget({
    super.key,
    required this.countrySelected,
    required this.countryCodeInputParameters,
    required this.phoneNumberInputParameters,
    required this.modal,
  });

  @override
  State<NbxPhoneFieldWidget> createState() => _NbxPhoneFieldWidgetState();
}

class _NbxPhoneFieldWidgetState extends State<NbxPhoneFieldWidget> {
  late Country? _currentCountrySelected;
  late TextEditingController _numberPhoneController;

  @override
  void initState() {
    super.initState();
    _initializeState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  /// Initializes the widget state with default values.
  void _initializeState() {
    _currentCountrySelected = widget.countrySelected;
    _numberPhoneController =
        widget.phoneNumberInputParameters.controller ?? TextEditingController();
  }

  /// Disposes of controllers to prevent memory leaks.
  void _disposeControllers() {
    // Only dispose if we created the controller
    if (widget.phoneNumberInputParameters.controller == null) {
      _numberPhoneController.dispose();
    }
  }

  /// Handles country selection and clears the phone number input.
  ///
  /// @param selectedCountry: The newly selected country [Country].
  void _onCountrySelected(Country selectedCountry) {
    setState(() {
      _currentCountrySelected = selectedCountry;
      // Clear the phone number input when country changes
      _numberPhoneController.clear();
    });

    // Call the original onSelect callback if provided
    widget.modal.onSelect(selectedCountry);
  }

  /// Determines if the phone number input should be read-only.
  ///
  /// @returns: True if no country is selected, false otherwise [bool].
  bool get _isPhoneInputReadOnly => _currentCountrySelected == null;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildCountryPicker(), _buildPhoneNumberInput()],
    );
  }

  /// Builds the country picker widget.
  ///
  /// @returns: The country picker widget [Widget].
  Widget _buildCountryPicker() {
    return Flexible(
      flex: 1,
      child: NbxCountryPickerInput(
        inputParameters: widget.countryCodeInputParameters,
        modal: widget.modal.copyWith(
          showPhoneCode: true,
          onSelect: _onCountrySelected,
        ),
      ),
    );
  }

  /// Builds the phone number input widget.
  ///
  /// @returns: The phone number input widget [Widget].
  Widget _buildPhoneNumberInput() {
    return Flexible(
      flex: 2,
      child: NbxTextFormFieldWidget(
        widget.phoneNumberInputParameters.copyWith(
          maxLength: _currentCountrySelected?.maxLength,
          isReadOnly: _isPhoneInputReadOnly,
          controller: _numberPhoneController,

          customValidator:
              widget.phoneNumberInputParameters.customValidator ??
              (value) {
                final result = NbxInputValidator.validateWithRules(value, [
                  TextValidationRules.minLength(
                    minLength: _currentCountrySelected?.minLength ?? 0,
                  ),
                  TextValidationRules.maxLength(
                    maxLength: _currentCountrySelected?.maxLength ?? 0,
                  ),
                ]);

                return result;
              },
        ),
      ),
    );
  }
}
