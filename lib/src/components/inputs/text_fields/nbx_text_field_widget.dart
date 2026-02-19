import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A text input widget without Form integration.
///
/// Use [NbxTextFieldWidget] when you need a standalone text input that:
/// - Does not participate in Form validation
/// - Manages its own state via onChanged callbacks
/// - Is suitable for search fields, filters, or simple inputs
///
/// For Form-integrated validation, use [NbxTextFormFieldWidget] instead.
///
/// ## Example
///
/// ```dart
/// NbxTextFieldWidget(
///   NbxInputParameters(
///     context: context,
///     controller: myController,
///     isRequired: false,
///     inputType: NbxInputType.text,
///     labelText: 'Search',
///     hintText: 'Enter search term',
///     onChanged: (value) => print('Changed: $value'),
///   ),
/// )
/// ```
///
/// See also:
/// - [NbxTextFormFieldWidget] for Form-integrated inputs
/// - [TextField] the underlying Flutter widget
class NbxTextFieldWidget extends StatelessWidget {
  final NbxInputParameters inputParameters;
  const NbxTextFieldWidget(this.inputParameters, {super.key});

  @override
  Widget build(BuildContext context) {
    return NbxTextFieldWithStateWidget(
      parameters: inputParameters,
      childBuilder: (NbxInputParameters parameters) {
        final InputDecoration decorationWithReducedPadding = parameters
            .inputDecoration
            .copyWith(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            );

        return TextField(
          obscureText: parameters.obscureText,
          readOnly: parameters.isReadOnly,
          enabled: parameters.isEnabled,
          // style: TextStyle(color: AppTheme.colors.textContent),
          cursorColor: Colors.black,
          onChanged: parameters.onChanged,
          maxLength: parameters.maxLength,
          textInputAction: parameters.textInputAction,
          controller: parameters.controller,
          inputFormatters: parameters.textInputFormatter,
          // validator: parameters.inputValidator,
          keyboardType: parameters.keyboardType,
          minLines: parameters.minLines,
          maxLines: parameters.maxLines ?? 1,
          decoration: decorationWithReducedPadding,
          onTapOutside: (event) {
            final FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
        );
      },
    );
  }
}
