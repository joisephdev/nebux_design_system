// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nbx_input_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NbxInputParameters {

 String? get hintText; String? get labelText; bool get isRequired; NbxInputType get inputType; FloatingLabelBehavior? get floatingLabelBehavior; bool get obscureText; bool get isReadOnly; bool get isEnabled; bool get autoDisposeController; bool get showErrorText; AutovalidateMode get autovalidateMode; String? get requiredErrorMessage;// Pure validator: receives input value, returns error message or null (native Flutter contract).
 String? Function(String? value)? get validator;// Notification callback: called with the FINAL error post-validation (null = valid).
// Use for ShadowInputWrapper, onValidationChanged, etc. — no Future.delayed needed.
 void Function(String? errorMessage)? get onValidationResult; int? get minLines; int? get maxLines; int? get maxLength;// Custom suffix widget — takes priority over suffixIconType.
 Widget? get suffixIcon; Widget? get prefixIcon; Color? get fillColor; TextInputAction? get textInputAction; TextEditingController? get controller; VoidCallback? get suffixOnPressed; ValueChanged<String>? get onSubmitted; ValueChanged<String>? get onChanged; List<TextInputFormatter>? get inputFormatters; NbxInputDecorationStyle get decorationStyle;// Automatic suffix icon type. Ignored when suffixIcon is provided.
 NbxSuffixIconType get suffixIconType;// Visual state of the input field (neutral, success, error).
 NbxInputState get inputState;// Supporting text displayed below the input field.
 String? get helperText;// Whether to show a character counter when maxLength is set.
 bool get showCharacterCounter; InputBorder? get border; InputBorder? get enabledBorder; InputBorder? get focusedBorder; InputBorder? get errorBorder; InputBorder? get focusedErrorBorder; InputBorder? get disabledBorder; void Function()? get onTap;
/// Create a copy of NbxInputParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbxInputParametersCopyWith<NbxInputParameters> get copyWith => _$NbxInputParametersCopyWithImpl<NbxInputParameters>(this as NbxInputParameters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbxInputParameters&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.labelText, labelText) || other.labelText == labelText)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.inputType, inputType) || other.inputType == inputType)&&(identical(other.floatingLabelBehavior, floatingLabelBehavior) || other.floatingLabelBehavior == floatingLabelBehavior)&&(identical(other.obscureText, obscureText) || other.obscureText == obscureText)&&(identical(other.isReadOnly, isReadOnly) || other.isReadOnly == isReadOnly)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.autoDisposeController, autoDisposeController) || other.autoDisposeController == autoDisposeController)&&(identical(other.showErrorText, showErrorText) || other.showErrorText == showErrorText)&&(identical(other.autovalidateMode, autovalidateMode) || other.autovalidateMode == autovalidateMode)&&(identical(other.requiredErrorMessage, requiredErrorMessage) || other.requiredErrorMessage == requiredErrorMessage)&&(identical(other.validator, validator) || other.validator == validator)&&(identical(other.onValidationResult, onValidationResult) || other.onValidationResult == onValidationResult)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.suffixIcon, suffixIcon) || other.suffixIcon == suffixIcon)&&(identical(other.prefixIcon, prefixIcon) || other.prefixIcon == prefixIcon)&&(identical(other.fillColor, fillColor) || other.fillColor == fillColor)&&(identical(other.textInputAction, textInputAction) || other.textInputAction == textInputAction)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.suffixOnPressed, suffixOnPressed) || other.suffixOnPressed == suffixOnPressed)&&(identical(other.onSubmitted, onSubmitted) || other.onSubmitted == onSubmitted)&&(identical(other.onChanged, onChanged) || other.onChanged == onChanged)&&const DeepCollectionEquality().equals(other.inputFormatters, inputFormatters)&&(identical(other.decorationStyle, decorationStyle) || other.decorationStyle == decorationStyle)&&(identical(other.suffixIconType, suffixIconType) || other.suffixIconType == suffixIconType)&&(identical(other.inputState, inputState) || other.inputState == inputState)&&(identical(other.helperText, helperText) || other.helperText == helperText)&&(identical(other.showCharacterCounter, showCharacterCounter) || other.showCharacterCounter == showCharacterCounter)&&(identical(other.border, border) || other.border == border)&&(identical(other.enabledBorder, enabledBorder) || other.enabledBorder == enabledBorder)&&(identical(other.focusedBorder, focusedBorder) || other.focusedBorder == focusedBorder)&&(identical(other.errorBorder, errorBorder) || other.errorBorder == errorBorder)&&(identical(other.focusedErrorBorder, focusedErrorBorder) || other.focusedErrorBorder == focusedErrorBorder)&&(identical(other.disabledBorder, disabledBorder) || other.disabledBorder == disabledBorder)&&(identical(other.onTap, onTap) || other.onTap == onTap));
}


@override
int get hashCode => Object.hashAll([runtimeType,hintText,labelText,isRequired,inputType,floatingLabelBehavior,obscureText,isReadOnly,isEnabled,autoDisposeController,showErrorText,autovalidateMode,requiredErrorMessage,validator,onValidationResult,minLines,maxLines,maxLength,suffixIcon,prefixIcon,fillColor,textInputAction,controller,suffixOnPressed,onSubmitted,onChanged,const DeepCollectionEquality().hash(inputFormatters),decorationStyle,suffixIconType,inputState,helperText,showCharacterCounter,border,enabledBorder,focusedBorder,errorBorder,focusedErrorBorder,disabledBorder,onTap]);

@override
String toString() {
  return 'NbxInputParameters(hintText: $hintText, labelText: $labelText, isRequired: $isRequired, inputType: $inputType, floatingLabelBehavior: $floatingLabelBehavior, obscureText: $obscureText, isReadOnly: $isReadOnly, isEnabled: $isEnabled, autoDisposeController: $autoDisposeController, showErrorText: $showErrorText, autovalidateMode: $autovalidateMode, requiredErrorMessage: $requiredErrorMessage, validator: $validator, onValidationResult: $onValidationResult, minLines: $minLines, maxLines: $maxLines, maxLength: $maxLength, suffixIcon: $suffixIcon, prefixIcon: $prefixIcon, fillColor: $fillColor, textInputAction: $textInputAction, controller: $controller, suffixOnPressed: $suffixOnPressed, onSubmitted: $onSubmitted, onChanged: $onChanged, inputFormatters: $inputFormatters, decorationStyle: $decorationStyle, suffixIconType: $suffixIconType, inputState: $inputState, helperText: $helperText, showCharacterCounter: $showCharacterCounter, border: $border, enabledBorder: $enabledBorder, focusedBorder: $focusedBorder, errorBorder: $errorBorder, focusedErrorBorder: $focusedErrorBorder, disabledBorder: $disabledBorder, onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class $NbxInputParametersCopyWith<$Res>  {
  factory $NbxInputParametersCopyWith(NbxInputParameters value, $Res Function(NbxInputParameters) _then) = _$NbxInputParametersCopyWithImpl;
@useResult
$Res call({
 String? hintText, String? labelText, bool isRequired, NbxInputType inputType, FloatingLabelBehavior? floatingLabelBehavior, bool obscureText, bool isReadOnly, bool isEnabled, bool autoDisposeController, bool showErrorText, AutovalidateMode autovalidateMode, String? requiredErrorMessage, String? Function(String? value)? validator, void Function(String? errorMessage)? onValidationResult, int? minLines, int? maxLines, int? maxLength, Widget? suffixIcon, Widget? prefixIcon, Color? fillColor, TextInputAction? textInputAction, TextEditingController? controller, VoidCallback? suffixOnPressed, ValueChanged<String>? onSubmitted, ValueChanged<String>? onChanged, List<TextInputFormatter>? inputFormatters, NbxInputDecorationStyle decorationStyle, NbxSuffixIconType suffixIconType, NbxInputState inputState, String? helperText, bool showCharacterCounter, InputBorder? border, InputBorder? enabledBorder, InputBorder? focusedBorder, InputBorder? errorBorder, InputBorder? focusedErrorBorder, InputBorder? disabledBorder, void Function()? onTap
});




}
/// @nodoc
class _$NbxInputParametersCopyWithImpl<$Res>
    implements $NbxInputParametersCopyWith<$Res> {
  _$NbxInputParametersCopyWithImpl(this._self, this._then);

  final NbxInputParameters _self;
  final $Res Function(NbxInputParameters) _then;

/// Create a copy of NbxInputParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hintText = freezed,Object? labelText = freezed,Object? isRequired = null,Object? inputType = null,Object? floatingLabelBehavior = freezed,Object? obscureText = null,Object? isReadOnly = null,Object? isEnabled = null,Object? autoDisposeController = null,Object? showErrorText = null,Object? autovalidateMode = null,Object? requiredErrorMessage = freezed,Object? validator = freezed,Object? onValidationResult = freezed,Object? minLines = freezed,Object? maxLines = freezed,Object? maxLength = freezed,Object? suffixIcon = freezed,Object? prefixIcon = freezed,Object? fillColor = freezed,Object? textInputAction = freezed,Object? controller = freezed,Object? suffixOnPressed = freezed,Object? onSubmitted = freezed,Object? onChanged = freezed,Object? inputFormatters = freezed,Object? decorationStyle = null,Object? suffixIconType = null,Object? inputState = null,Object? helperText = freezed,Object? showCharacterCounter = null,Object? border = freezed,Object? enabledBorder = freezed,Object? focusedBorder = freezed,Object? errorBorder = freezed,Object? focusedErrorBorder = freezed,Object? disabledBorder = freezed,Object? onTap = freezed,}) {
  return _then(_self.copyWith(
hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,inputType: null == inputType ? _self.inputType : inputType // ignore: cast_nullable_to_non_nullable
as NbxInputType,floatingLabelBehavior: freezed == floatingLabelBehavior ? _self.floatingLabelBehavior : floatingLabelBehavior // ignore: cast_nullable_to_non_nullable
as FloatingLabelBehavior?,obscureText: null == obscureText ? _self.obscureText : obscureText // ignore: cast_nullable_to_non_nullable
as bool,isReadOnly: null == isReadOnly ? _self.isReadOnly : isReadOnly // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoDisposeController: null == autoDisposeController ? _self.autoDisposeController : autoDisposeController // ignore: cast_nullable_to_non_nullable
as bool,showErrorText: null == showErrorText ? _self.showErrorText : showErrorText // ignore: cast_nullable_to_non_nullable
as bool,autovalidateMode: null == autovalidateMode ? _self.autovalidateMode : autovalidateMode // ignore: cast_nullable_to_non_nullable
as AutovalidateMode,requiredErrorMessage: freezed == requiredErrorMessage ? _self.requiredErrorMessage : requiredErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,validator: freezed == validator ? _self.validator : validator // ignore: cast_nullable_to_non_nullable
as String? Function(String? value)?,onValidationResult: freezed == onValidationResult ? _self.onValidationResult : onValidationResult // ignore: cast_nullable_to_non_nullable
as void Function(String? errorMessage)?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,maxLength: freezed == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int?,suffixIcon: freezed == suffixIcon ? _self.suffixIcon : suffixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,prefixIcon: freezed == prefixIcon ? _self.prefixIcon : prefixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,fillColor: freezed == fillColor ? _self.fillColor : fillColor // ignore: cast_nullable_to_non_nullable
as Color?,textInputAction: freezed == textInputAction ? _self.textInputAction : textInputAction // ignore: cast_nullable_to_non_nullable
as TextInputAction?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as TextEditingController?,suffixOnPressed: freezed == suffixOnPressed ? _self.suffixOnPressed : suffixOnPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,onSubmitted: freezed == onSubmitted ? _self.onSubmitted : onSubmitted // ignore: cast_nullable_to_non_nullable
as ValueChanged<String>?,onChanged: freezed == onChanged ? _self.onChanged : onChanged // ignore: cast_nullable_to_non_nullable
as ValueChanged<String>?,inputFormatters: freezed == inputFormatters ? _self.inputFormatters : inputFormatters // ignore: cast_nullable_to_non_nullable
as List<TextInputFormatter>?,decorationStyle: null == decorationStyle ? _self.decorationStyle : decorationStyle // ignore: cast_nullable_to_non_nullable
as NbxInputDecorationStyle,suffixIconType: null == suffixIconType ? _self.suffixIconType : suffixIconType // ignore: cast_nullable_to_non_nullable
as NbxSuffixIconType,inputState: null == inputState ? _self.inputState : inputState // ignore: cast_nullable_to_non_nullable
as NbxInputState,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,showCharacterCounter: null == showCharacterCounter ? _self.showCharacterCounter : showCharacterCounter // ignore: cast_nullable_to_non_nullable
as bool,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as InputBorder?,enabledBorder: freezed == enabledBorder ? _self.enabledBorder : enabledBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,focusedBorder: freezed == focusedBorder ? _self.focusedBorder : focusedBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,errorBorder: freezed == errorBorder ? _self.errorBorder : errorBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,focusedErrorBorder: freezed == focusedErrorBorder ? _self.focusedErrorBorder : focusedErrorBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,disabledBorder: freezed == disabledBorder ? _self.disabledBorder : disabledBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

}


/// Adds pattern-matching-related methods to [NbxInputParameters].
extension NbxInputParametersPatterns on NbxInputParameters {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbxInputParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbxInputParameters() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbxInputParameters value)  $default,){
final _that = this;
switch (_that) {
case _NbxInputParameters():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbxInputParameters value)?  $default,){
final _that = this;
switch (_that) {
case _NbxInputParameters() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? hintText,  String? labelText,  bool isRequired,  NbxInputType inputType,  FloatingLabelBehavior? floatingLabelBehavior,  bool obscureText,  bool isReadOnly,  bool isEnabled,  bool autoDisposeController,  bool showErrorText,  AutovalidateMode autovalidateMode,  String? requiredErrorMessage,  String? Function(String? value)? validator,  void Function(String? errorMessage)? onValidationResult,  int? minLines,  int? maxLines,  int? maxLength,  Widget? suffixIcon,  Widget? prefixIcon,  Color? fillColor,  TextInputAction? textInputAction,  TextEditingController? controller,  VoidCallback? suffixOnPressed,  ValueChanged<String>? onSubmitted,  ValueChanged<String>? onChanged,  List<TextInputFormatter>? inputFormatters,  NbxInputDecorationStyle decorationStyle,  NbxSuffixIconType suffixIconType,  NbxInputState inputState,  String? helperText,  bool showCharacterCounter,  InputBorder? border,  InputBorder? enabledBorder,  InputBorder? focusedBorder,  InputBorder? errorBorder,  InputBorder? focusedErrorBorder,  InputBorder? disabledBorder,  void Function()? onTap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbxInputParameters() when $default != null:
return $default(_that.hintText,_that.labelText,_that.isRequired,_that.inputType,_that.floatingLabelBehavior,_that.obscureText,_that.isReadOnly,_that.isEnabled,_that.autoDisposeController,_that.showErrorText,_that.autovalidateMode,_that.requiredErrorMessage,_that.validator,_that.onValidationResult,_that.minLines,_that.maxLines,_that.maxLength,_that.suffixIcon,_that.prefixIcon,_that.fillColor,_that.textInputAction,_that.controller,_that.suffixOnPressed,_that.onSubmitted,_that.onChanged,_that.inputFormatters,_that.decorationStyle,_that.suffixIconType,_that.inputState,_that.helperText,_that.showCharacterCounter,_that.border,_that.enabledBorder,_that.focusedBorder,_that.errorBorder,_that.focusedErrorBorder,_that.disabledBorder,_that.onTap);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? hintText,  String? labelText,  bool isRequired,  NbxInputType inputType,  FloatingLabelBehavior? floatingLabelBehavior,  bool obscureText,  bool isReadOnly,  bool isEnabled,  bool autoDisposeController,  bool showErrorText,  AutovalidateMode autovalidateMode,  String? requiredErrorMessage,  String? Function(String? value)? validator,  void Function(String? errorMessage)? onValidationResult,  int? minLines,  int? maxLines,  int? maxLength,  Widget? suffixIcon,  Widget? prefixIcon,  Color? fillColor,  TextInputAction? textInputAction,  TextEditingController? controller,  VoidCallback? suffixOnPressed,  ValueChanged<String>? onSubmitted,  ValueChanged<String>? onChanged,  List<TextInputFormatter>? inputFormatters,  NbxInputDecorationStyle decorationStyle,  NbxSuffixIconType suffixIconType,  NbxInputState inputState,  String? helperText,  bool showCharacterCounter,  InputBorder? border,  InputBorder? enabledBorder,  InputBorder? focusedBorder,  InputBorder? errorBorder,  InputBorder? focusedErrorBorder,  InputBorder? disabledBorder,  void Function()? onTap)  $default,) {final _that = this;
switch (_that) {
case _NbxInputParameters():
return $default(_that.hintText,_that.labelText,_that.isRequired,_that.inputType,_that.floatingLabelBehavior,_that.obscureText,_that.isReadOnly,_that.isEnabled,_that.autoDisposeController,_that.showErrorText,_that.autovalidateMode,_that.requiredErrorMessage,_that.validator,_that.onValidationResult,_that.minLines,_that.maxLines,_that.maxLength,_that.suffixIcon,_that.prefixIcon,_that.fillColor,_that.textInputAction,_that.controller,_that.suffixOnPressed,_that.onSubmitted,_that.onChanged,_that.inputFormatters,_that.decorationStyle,_that.suffixIconType,_that.inputState,_that.helperText,_that.showCharacterCounter,_that.border,_that.enabledBorder,_that.focusedBorder,_that.errorBorder,_that.focusedErrorBorder,_that.disabledBorder,_that.onTap);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? hintText,  String? labelText,  bool isRequired,  NbxInputType inputType,  FloatingLabelBehavior? floatingLabelBehavior,  bool obscureText,  bool isReadOnly,  bool isEnabled,  bool autoDisposeController,  bool showErrorText,  AutovalidateMode autovalidateMode,  String? requiredErrorMessage,  String? Function(String? value)? validator,  void Function(String? errorMessage)? onValidationResult,  int? minLines,  int? maxLines,  int? maxLength,  Widget? suffixIcon,  Widget? prefixIcon,  Color? fillColor,  TextInputAction? textInputAction,  TextEditingController? controller,  VoidCallback? suffixOnPressed,  ValueChanged<String>? onSubmitted,  ValueChanged<String>? onChanged,  List<TextInputFormatter>? inputFormatters,  NbxInputDecorationStyle decorationStyle,  NbxSuffixIconType suffixIconType,  NbxInputState inputState,  String? helperText,  bool showCharacterCounter,  InputBorder? border,  InputBorder? enabledBorder,  InputBorder? focusedBorder,  InputBorder? errorBorder,  InputBorder? focusedErrorBorder,  InputBorder? disabledBorder,  void Function()? onTap)?  $default,) {final _that = this;
switch (_that) {
case _NbxInputParameters() when $default != null:
return $default(_that.hintText,_that.labelText,_that.isRequired,_that.inputType,_that.floatingLabelBehavior,_that.obscureText,_that.isReadOnly,_that.isEnabled,_that.autoDisposeController,_that.showErrorText,_that.autovalidateMode,_that.requiredErrorMessage,_that.validator,_that.onValidationResult,_that.minLines,_that.maxLines,_that.maxLength,_that.suffixIcon,_that.prefixIcon,_that.fillColor,_that.textInputAction,_that.controller,_that.suffixOnPressed,_that.onSubmitted,_that.onChanged,_that.inputFormatters,_that.decorationStyle,_that.suffixIconType,_that.inputState,_that.helperText,_that.showCharacterCounter,_that.border,_that.enabledBorder,_that.focusedBorder,_that.errorBorder,_that.focusedErrorBorder,_that.disabledBorder,_that.onTap);case _:
  return null;

}
}

}

/// @nodoc


class _NbxInputParameters implements NbxInputParameters {
   _NbxInputParameters({this.hintText, this.labelText, required this.isRequired, required this.inputType, this.floatingLabelBehavior, this.obscureText = false, this.isReadOnly = false, this.isEnabled = true, this.autoDisposeController = true, this.showErrorText = true, this.autovalidateMode = AutovalidateMode.onUserInteraction, this.requiredErrorMessage, this.validator, this.onValidationResult, this.minLines, this.maxLines, this.maxLength, this.suffixIcon, this.prefixIcon, this.fillColor, this.textInputAction, this.controller, this.suffixOnPressed, this.onSubmitted, this.onChanged, final  List<TextInputFormatter>? inputFormatters, this.decorationStyle = NbxInputDecorationStyle.outlined, this.suffixIconType = NbxSuffixIconType.none, this.inputState = NbxInputState.neutral, this.helperText, this.showCharacterCounter = false, this.border, this.enabledBorder, this.focusedBorder, this.errorBorder, this.focusedErrorBorder, this.disabledBorder, this.onTap}): assert(isRequired == true && requiredErrorMessage != null || isRequired == false, 'The message is necessary for required fields'),assert(labelText != null || hintText != null, 'Either labelText or hintText must be provided'),assert(decorationStyle != NbxInputDecorationStyle.outlined || (labelText != null && hintText != null), 'When formType is outlined, both labelText and hintText must be provided'),_inputFormatters = inputFormatters;
  

@override final  String? hintText;
@override final  String? labelText;
@override final  bool isRequired;
@override final  NbxInputType inputType;
@override final  FloatingLabelBehavior? floatingLabelBehavior;
@override@JsonKey() final  bool obscureText;
@override@JsonKey() final  bool isReadOnly;
@override@JsonKey() final  bool isEnabled;
@override@JsonKey() final  bool autoDisposeController;
@override@JsonKey() final  bool showErrorText;
@override@JsonKey() final  AutovalidateMode autovalidateMode;
@override final  String? requiredErrorMessage;
// Pure validator: receives input value, returns error message or null (native Flutter contract).
@override final  String? Function(String? value)? validator;
// Notification callback: called with the FINAL error post-validation (null = valid).
// Use for ShadowInputWrapper, onValidationChanged, etc. — no Future.delayed needed.
@override final  void Function(String? errorMessage)? onValidationResult;
@override final  int? minLines;
@override final  int? maxLines;
@override final  int? maxLength;
// Custom suffix widget — takes priority over suffixIconType.
@override final  Widget? suffixIcon;
@override final  Widget? prefixIcon;
@override final  Color? fillColor;
@override final  TextInputAction? textInputAction;
@override final  TextEditingController? controller;
@override final  VoidCallback? suffixOnPressed;
@override final  ValueChanged<String>? onSubmitted;
@override final  ValueChanged<String>? onChanged;
 final  List<TextInputFormatter>? _inputFormatters;
@override List<TextInputFormatter>? get inputFormatters {
  final value = _inputFormatters;
  if (value == null) return null;
  if (_inputFormatters is EqualUnmodifiableListView) return _inputFormatters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  NbxInputDecorationStyle decorationStyle;
// Automatic suffix icon type. Ignored when suffixIcon is provided.
@override@JsonKey() final  NbxSuffixIconType suffixIconType;
// Visual state of the input field (neutral, success, error).
@override@JsonKey() final  NbxInputState inputState;
// Supporting text displayed below the input field.
@override final  String? helperText;
// Whether to show a character counter when maxLength is set.
@override@JsonKey() final  bool showCharacterCounter;
@override final  InputBorder? border;
@override final  InputBorder? enabledBorder;
@override final  InputBorder? focusedBorder;
@override final  InputBorder? errorBorder;
@override final  InputBorder? focusedErrorBorder;
@override final  InputBorder? disabledBorder;
@override final  void Function()? onTap;

/// Create a copy of NbxInputParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbxInputParametersCopyWith<_NbxInputParameters> get copyWith => __$NbxInputParametersCopyWithImpl<_NbxInputParameters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbxInputParameters&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.labelText, labelText) || other.labelText == labelText)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.inputType, inputType) || other.inputType == inputType)&&(identical(other.floatingLabelBehavior, floatingLabelBehavior) || other.floatingLabelBehavior == floatingLabelBehavior)&&(identical(other.obscureText, obscureText) || other.obscureText == obscureText)&&(identical(other.isReadOnly, isReadOnly) || other.isReadOnly == isReadOnly)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.autoDisposeController, autoDisposeController) || other.autoDisposeController == autoDisposeController)&&(identical(other.showErrorText, showErrorText) || other.showErrorText == showErrorText)&&(identical(other.autovalidateMode, autovalidateMode) || other.autovalidateMode == autovalidateMode)&&(identical(other.requiredErrorMessage, requiredErrorMessage) || other.requiredErrorMessage == requiredErrorMessage)&&(identical(other.validator, validator) || other.validator == validator)&&(identical(other.onValidationResult, onValidationResult) || other.onValidationResult == onValidationResult)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.suffixIcon, suffixIcon) || other.suffixIcon == suffixIcon)&&(identical(other.prefixIcon, prefixIcon) || other.prefixIcon == prefixIcon)&&(identical(other.fillColor, fillColor) || other.fillColor == fillColor)&&(identical(other.textInputAction, textInputAction) || other.textInputAction == textInputAction)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.suffixOnPressed, suffixOnPressed) || other.suffixOnPressed == suffixOnPressed)&&(identical(other.onSubmitted, onSubmitted) || other.onSubmitted == onSubmitted)&&(identical(other.onChanged, onChanged) || other.onChanged == onChanged)&&const DeepCollectionEquality().equals(other._inputFormatters, _inputFormatters)&&(identical(other.decorationStyle, decorationStyle) || other.decorationStyle == decorationStyle)&&(identical(other.suffixIconType, suffixIconType) || other.suffixIconType == suffixIconType)&&(identical(other.inputState, inputState) || other.inputState == inputState)&&(identical(other.helperText, helperText) || other.helperText == helperText)&&(identical(other.showCharacterCounter, showCharacterCounter) || other.showCharacterCounter == showCharacterCounter)&&(identical(other.border, border) || other.border == border)&&(identical(other.enabledBorder, enabledBorder) || other.enabledBorder == enabledBorder)&&(identical(other.focusedBorder, focusedBorder) || other.focusedBorder == focusedBorder)&&(identical(other.errorBorder, errorBorder) || other.errorBorder == errorBorder)&&(identical(other.focusedErrorBorder, focusedErrorBorder) || other.focusedErrorBorder == focusedErrorBorder)&&(identical(other.disabledBorder, disabledBorder) || other.disabledBorder == disabledBorder)&&(identical(other.onTap, onTap) || other.onTap == onTap));
}


@override
int get hashCode => Object.hashAll([runtimeType,hintText,labelText,isRequired,inputType,floatingLabelBehavior,obscureText,isReadOnly,isEnabled,autoDisposeController,showErrorText,autovalidateMode,requiredErrorMessage,validator,onValidationResult,minLines,maxLines,maxLength,suffixIcon,prefixIcon,fillColor,textInputAction,controller,suffixOnPressed,onSubmitted,onChanged,const DeepCollectionEquality().hash(_inputFormatters),decorationStyle,suffixIconType,inputState,helperText,showCharacterCounter,border,enabledBorder,focusedBorder,errorBorder,focusedErrorBorder,disabledBorder,onTap]);

@override
String toString() {
  return 'NbxInputParameters(hintText: $hintText, labelText: $labelText, isRequired: $isRequired, inputType: $inputType, floatingLabelBehavior: $floatingLabelBehavior, obscureText: $obscureText, isReadOnly: $isReadOnly, isEnabled: $isEnabled, autoDisposeController: $autoDisposeController, showErrorText: $showErrorText, autovalidateMode: $autovalidateMode, requiredErrorMessage: $requiredErrorMessage, validator: $validator, onValidationResult: $onValidationResult, minLines: $minLines, maxLines: $maxLines, maxLength: $maxLength, suffixIcon: $suffixIcon, prefixIcon: $prefixIcon, fillColor: $fillColor, textInputAction: $textInputAction, controller: $controller, suffixOnPressed: $suffixOnPressed, onSubmitted: $onSubmitted, onChanged: $onChanged, inputFormatters: $inputFormatters, decorationStyle: $decorationStyle, suffixIconType: $suffixIconType, inputState: $inputState, helperText: $helperText, showCharacterCounter: $showCharacterCounter, border: $border, enabledBorder: $enabledBorder, focusedBorder: $focusedBorder, errorBorder: $errorBorder, focusedErrorBorder: $focusedErrorBorder, disabledBorder: $disabledBorder, onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class _$NbxInputParametersCopyWith<$Res> implements $NbxInputParametersCopyWith<$Res> {
  factory _$NbxInputParametersCopyWith(_NbxInputParameters value, $Res Function(_NbxInputParameters) _then) = __$NbxInputParametersCopyWithImpl;
@override @useResult
$Res call({
 String? hintText, String? labelText, bool isRequired, NbxInputType inputType, FloatingLabelBehavior? floatingLabelBehavior, bool obscureText, bool isReadOnly, bool isEnabled, bool autoDisposeController, bool showErrorText, AutovalidateMode autovalidateMode, String? requiredErrorMessage, String? Function(String? value)? validator, void Function(String? errorMessage)? onValidationResult, int? minLines, int? maxLines, int? maxLength, Widget? suffixIcon, Widget? prefixIcon, Color? fillColor, TextInputAction? textInputAction, TextEditingController? controller, VoidCallback? suffixOnPressed, ValueChanged<String>? onSubmitted, ValueChanged<String>? onChanged, List<TextInputFormatter>? inputFormatters, NbxInputDecorationStyle decorationStyle, NbxSuffixIconType suffixIconType, NbxInputState inputState, String? helperText, bool showCharacterCounter, InputBorder? border, InputBorder? enabledBorder, InputBorder? focusedBorder, InputBorder? errorBorder, InputBorder? focusedErrorBorder, InputBorder? disabledBorder, void Function()? onTap
});




}
/// @nodoc
class __$NbxInputParametersCopyWithImpl<$Res>
    implements _$NbxInputParametersCopyWith<$Res> {
  __$NbxInputParametersCopyWithImpl(this._self, this._then);

  final _NbxInputParameters _self;
  final $Res Function(_NbxInputParameters) _then;

/// Create a copy of NbxInputParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hintText = freezed,Object? labelText = freezed,Object? isRequired = null,Object? inputType = null,Object? floatingLabelBehavior = freezed,Object? obscureText = null,Object? isReadOnly = null,Object? isEnabled = null,Object? autoDisposeController = null,Object? showErrorText = null,Object? autovalidateMode = null,Object? requiredErrorMessage = freezed,Object? validator = freezed,Object? onValidationResult = freezed,Object? minLines = freezed,Object? maxLines = freezed,Object? maxLength = freezed,Object? suffixIcon = freezed,Object? prefixIcon = freezed,Object? fillColor = freezed,Object? textInputAction = freezed,Object? controller = freezed,Object? suffixOnPressed = freezed,Object? onSubmitted = freezed,Object? onChanged = freezed,Object? inputFormatters = freezed,Object? decorationStyle = null,Object? suffixIconType = null,Object? inputState = null,Object? helperText = freezed,Object? showCharacterCounter = null,Object? border = freezed,Object? enabledBorder = freezed,Object? focusedBorder = freezed,Object? errorBorder = freezed,Object? focusedErrorBorder = freezed,Object? disabledBorder = freezed,Object? onTap = freezed,}) {
  return _then(_NbxInputParameters(
hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,inputType: null == inputType ? _self.inputType : inputType // ignore: cast_nullable_to_non_nullable
as NbxInputType,floatingLabelBehavior: freezed == floatingLabelBehavior ? _self.floatingLabelBehavior : floatingLabelBehavior // ignore: cast_nullable_to_non_nullable
as FloatingLabelBehavior?,obscureText: null == obscureText ? _self.obscureText : obscureText // ignore: cast_nullable_to_non_nullable
as bool,isReadOnly: null == isReadOnly ? _self.isReadOnly : isReadOnly // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoDisposeController: null == autoDisposeController ? _self.autoDisposeController : autoDisposeController // ignore: cast_nullable_to_non_nullable
as bool,showErrorText: null == showErrorText ? _self.showErrorText : showErrorText // ignore: cast_nullable_to_non_nullable
as bool,autovalidateMode: null == autovalidateMode ? _self.autovalidateMode : autovalidateMode // ignore: cast_nullable_to_non_nullable
as AutovalidateMode,requiredErrorMessage: freezed == requiredErrorMessage ? _self.requiredErrorMessage : requiredErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,validator: freezed == validator ? _self.validator : validator // ignore: cast_nullable_to_non_nullable
as String? Function(String? value)?,onValidationResult: freezed == onValidationResult ? _self.onValidationResult : onValidationResult // ignore: cast_nullable_to_non_nullable
as void Function(String? errorMessage)?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,maxLength: freezed == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int?,suffixIcon: freezed == suffixIcon ? _self.suffixIcon : suffixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,prefixIcon: freezed == prefixIcon ? _self.prefixIcon : prefixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,fillColor: freezed == fillColor ? _self.fillColor : fillColor // ignore: cast_nullable_to_non_nullable
as Color?,textInputAction: freezed == textInputAction ? _self.textInputAction : textInputAction // ignore: cast_nullable_to_non_nullable
as TextInputAction?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as TextEditingController?,suffixOnPressed: freezed == suffixOnPressed ? _self.suffixOnPressed : suffixOnPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,onSubmitted: freezed == onSubmitted ? _self.onSubmitted : onSubmitted // ignore: cast_nullable_to_non_nullable
as ValueChanged<String>?,onChanged: freezed == onChanged ? _self.onChanged : onChanged // ignore: cast_nullable_to_non_nullable
as ValueChanged<String>?,inputFormatters: freezed == inputFormatters ? _self._inputFormatters : inputFormatters // ignore: cast_nullable_to_non_nullable
as List<TextInputFormatter>?,decorationStyle: null == decorationStyle ? _self.decorationStyle : decorationStyle // ignore: cast_nullable_to_non_nullable
as NbxInputDecorationStyle,suffixIconType: null == suffixIconType ? _self.suffixIconType : suffixIconType // ignore: cast_nullable_to_non_nullable
as NbxSuffixIconType,inputState: null == inputState ? _self.inputState : inputState // ignore: cast_nullable_to_non_nullable
as NbxInputState,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,showCharacterCounter: null == showCharacterCounter ? _self.showCharacterCounter : showCharacterCounter // ignore: cast_nullable_to_non_nullable
as bool,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as InputBorder?,enabledBorder: freezed == enabledBorder ? _self.enabledBorder : enabledBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,focusedBorder: freezed == focusedBorder ? _self.focusedBorder : focusedBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,errorBorder: freezed == errorBorder ? _self.errorBorder : errorBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,focusedErrorBorder: freezed == focusedErrorBorder ? _self.focusedErrorBorder : focusedErrorBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,disabledBorder: freezed == disabledBorder ? _self.disabledBorder : disabledBorder // ignore: cast_nullable_to_non_nullable
as InputBorder?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

// dart format on
