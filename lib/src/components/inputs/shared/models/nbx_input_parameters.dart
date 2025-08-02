import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

part 'nbx_input_parameters.freezed.dart';

@Freezed()
abstract class NbxInputParameters with _$NbxInputParameters {
  @Assert(
    '!(showEyeIcon == showCancelIcon) || (!showEyeIcon || !showCancelIcon)',
    'only one of them',
  )
  @Assert(
    'isRequired == true && requiredErrorMessage != null || isRequired == false',
    'The message is necessary for required fields',
  )
  factory NbxInputParameters({
    String? hintText,
    required String labelText,
    required bool isRequired,
    required NbxInputType inputType,
    required BuildContext context,
    FloatingLabelBehavior? floatingLabelBehavior,
    @Default(true) bool showSuffixIcon,
    @Default(false) bool obscureText,
    @Default(false) bool isReadOnly,
    @Default(true) bool isEnabled,
    @Default(false) bool showEyeIcon,
    @Default(false) bool showCancelIcon,
    @Default(true) bool autoDisposeController,
    @Default(false) bool forceShowSuffixIcon,
    @Default(AutovalidateMode.onUserInteraction)
    AutovalidateMode autovalidateMode,
    String? requiredErrorMessage,
    String? Function(String?)? validator,
    String? Function(String?, NbxInputType)? customValidator,
    int? minLines,
    int? maxLines,
    int? maxLength,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
    TextEditingController? controller,
    VoidCallback? suffixOnPressed,
    InputDecoration? decoration,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    void Function()? onTap,
  }) = _NbxInputParameters;
}
