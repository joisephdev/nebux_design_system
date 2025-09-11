import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

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
