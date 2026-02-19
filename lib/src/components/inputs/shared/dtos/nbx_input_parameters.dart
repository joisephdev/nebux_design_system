import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

part 'nbx_input_parameters.freezed.dart';

@Freezed()
abstract class NbxInputParameters with _$NbxInputParameters {
  @Assert(
    'isRequired == true && requiredErrorMessage != null || isRequired == false',
    'The message is necessary for required fields',
  )
  @Assert(
    'labelText != null || hintText != null',
    'Either labelText or hintText must be provided',
  )
  @Assert(
    'decorationStyle != NbxInputDecorationStyle.outlined || (labelText != null && hintText != null)',
    'When formType is outlined, both labelText and hintText must be provided',
  )
  factory NbxInputParameters({
    String? hintText,
    String? labelText,
    required bool isRequired,
    required NbxInputType inputType,
    required BuildContext context,
    FloatingLabelBehavior? floatingLabelBehavior,
    @Default(false) bool obscureText,
    @Default(false) bool isReadOnly,
    @Default(true) bool isEnabled,
    @Default(true) bool autoDisposeController,
    @Default(true) bool showErrorText,
    @Default(AutovalidateMode.onUserInteraction)
    AutovalidateMode autovalidateMode,
    String? requiredErrorMessage,
    // Pure validator: receives input value, returns error message or null (native Flutter contract).
    String? Function(String? value)? validator,
    // Notification callback: called with the FINAL error post-validation (null = valid).
    // Use for ShadowInputWrapper, onValidationChanged, etc. — no Future.delayed needed.
    void Function(String? errorMessage)? onValidationResult,
    int? minLines,
    int? maxLines,
    int? maxLength,
    // Custom suffix widget — takes priority over suffixIconType.
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    TextInputAction? textInputAction,
    TextEditingController? controller,
    VoidCallback? suffixOnPressed,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    @Default(NbxInputDecorationStyle.outlined)
    NbxInputDecorationStyle decorationStyle,
    // Automatic suffix icon type. Ignored when suffixIcon is provided.
    @Default(NbxSuffixIconType.none) NbxSuffixIconType suffixIconType,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    void Function()? onTap,
  }) = _NbxInputParameters;
}
