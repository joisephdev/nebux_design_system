import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxTextFormFieldWidget extends StatelessWidget {
  final NbxInputParameters inputParameters;
  final TextAlign? textFormAlign;

  const NbxTextFormFieldWidget(
    this.inputParameters, {
    super.key,
    this.textFormAlign,
  });

  @override
  Widget build(BuildContext context) {
    if (inputParameters.decorationStyle.isOutlined) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputParameters.labelText ?? inputParameters.hintText ?? '',
            maxLines: inputParameters.maxLines,
            style: context.nebuxTheme.typography.content.copyWith(
              color: context.nebuxColors.textPrimary,
            ),
          ),
          heightSpace4,
          _inputWidget(context),
        ],
      );
    }

    return _inputWidget(context);
  }

  Widget _inputWidget(BuildContext context) {
    return NbxTextFieldWithStateWidget(
      parameters: inputParameters,
      childBuilder: (NbxInputParameters parameters) {
        return TextFormField(
          textAlign: textFormAlign ?? TextAlign.start,
          onTap: parameters.onTap,
          enableInteractiveSelection: !parameters.isReadOnly,
          obscureText: parameters.obscureText,
          readOnly: parameters.isReadOnly,
          enabled: parameters.isEnabled,
          // style: TextStyle(color: AppTheme.colors.textContent),
          cursorColor: Colors.black,
          onChanged: parameters.onChanged,
          maxLength: parameters.maxLength,
          autovalidateMode: parameters.autovalidateMode,
          textInputAction: parameters.textInputAction,
          controller: parameters.controller,
          // decoration: parameters.decoration,
          decoration: parameters.inputDecoration,
          inputFormatters: parameters.textInputFormatter,
          validator: parameters.inputValidator,
          keyboardType: parameters.keyboardType,
          minLines: parameters.minLines,
          maxLines: parameters.maxLines ?? 1,
          // textAlign: TextAlign.center,
          style: context.nebuxTheme.typography.formInput.copyWith(
            color: context.nebuxColors.black,
          ),
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
