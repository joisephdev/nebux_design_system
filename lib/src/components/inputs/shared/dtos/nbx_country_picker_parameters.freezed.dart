// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nbx_country_picker_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NbxCountryPickerParameters {

 bool get isRequired; NbxInputType get inputType; NbxFormType get formType; TextEditingController get controller; String? get labelText; String? get hintText; String? get requiredErrorMessage; Widget? get prefixIcon;
/// Create a copy of NbxCountryPickerParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbxCountryPickerParametersCopyWith<NbxCountryPickerParameters> get copyWith => _$NbxCountryPickerParametersCopyWithImpl<NbxCountryPickerParameters>(this as NbxCountryPickerParameters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbxCountryPickerParameters&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.inputType, inputType) || other.inputType == inputType)&&(identical(other.formType, formType) || other.formType == formType)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.labelText, labelText) || other.labelText == labelText)&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.requiredErrorMessage, requiredErrorMessage) || other.requiredErrorMessage == requiredErrorMessage)&&(identical(other.prefixIcon, prefixIcon) || other.prefixIcon == prefixIcon));
}


@override
int get hashCode => Object.hash(runtimeType,isRequired,inputType,formType,controller,labelText,hintText,requiredErrorMessage,prefixIcon);

@override
String toString() {
  return 'NbxCountryPickerParameters(isRequired: $isRequired, inputType: $inputType, formType: $formType, controller: $controller, labelText: $labelText, hintText: $hintText, requiredErrorMessage: $requiredErrorMessage, prefixIcon: $prefixIcon)';
}


}

/// @nodoc
abstract mixin class $NbxCountryPickerParametersCopyWith<$Res>  {
  factory $NbxCountryPickerParametersCopyWith(NbxCountryPickerParameters value, $Res Function(NbxCountryPickerParameters) _then) = _$NbxCountryPickerParametersCopyWithImpl;
@useResult
$Res call({
 bool isRequired, NbxInputType inputType, NbxFormType formType, TextEditingController controller, String? labelText, String? hintText, String? requiredErrorMessage, Widget? prefixIcon
});




}
/// @nodoc
class _$NbxCountryPickerParametersCopyWithImpl<$Res>
    implements $NbxCountryPickerParametersCopyWith<$Res> {
  _$NbxCountryPickerParametersCopyWithImpl(this._self, this._then);

  final NbxCountryPickerParameters _self;
  final $Res Function(NbxCountryPickerParameters) _then;

/// Create a copy of NbxCountryPickerParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRequired = null,Object? inputType = null,Object? formType = null,Object? controller = null,Object? labelText = freezed,Object? hintText = freezed,Object? requiredErrorMessage = freezed,Object? prefixIcon = freezed,}) {
  return _then(_self.copyWith(
isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,inputType: null == inputType ? _self.inputType : inputType // ignore: cast_nullable_to_non_nullable
as NbxInputType,formType: null == formType ? _self.formType : formType // ignore: cast_nullable_to_non_nullable
as NbxFormType,controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as TextEditingController,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,requiredErrorMessage: freezed == requiredErrorMessage ? _self.requiredErrorMessage : requiredErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,prefixIcon: freezed == prefixIcon ? _self.prefixIcon : prefixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,
  ));
}

}


/// Adds pattern-matching-related methods to [NbxCountryPickerParameters].
extension NbxCountryPickerParametersPatterns on NbxCountryPickerParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbxCountryPickerParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbxCountryPickerParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbxCountryPickerParameters value)  $default,){
final _that = this;
switch (_that) {
case _NbxCountryPickerParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbxCountryPickerParameters value)?  $default,){
final _that = this;
switch (_that) {
case _NbxCountryPickerParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRequired,  NbxInputType inputType,  NbxFormType formType,  TextEditingController controller,  String? labelText,  String? hintText,  String? requiredErrorMessage,  Widget? prefixIcon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbxCountryPickerParameters() when $default != null:
return $default(_that.isRequired,_that.inputType,_that.formType,_that.controller,_that.labelText,_that.hintText,_that.requiredErrorMessage,_that.prefixIcon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRequired,  NbxInputType inputType,  NbxFormType formType,  TextEditingController controller,  String? labelText,  String? hintText,  String? requiredErrorMessage,  Widget? prefixIcon)  $default,) {final _that = this;
switch (_that) {
case _NbxCountryPickerParameters():
return $default(_that.isRequired,_that.inputType,_that.formType,_that.controller,_that.labelText,_that.hintText,_that.requiredErrorMessage,_that.prefixIcon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRequired,  NbxInputType inputType,  NbxFormType formType,  TextEditingController controller,  String? labelText,  String? hintText,  String? requiredErrorMessage,  Widget? prefixIcon)?  $default,) {final _that = this;
switch (_that) {
case _NbxCountryPickerParameters() when $default != null:
return $default(_that.isRequired,_that.inputType,_that.formType,_that.controller,_that.labelText,_that.hintText,_that.requiredErrorMessage,_that.prefixIcon);case _:
  return null;

}
}

}

/// @nodoc


class _NbxCountryPickerParameters implements NbxCountryPickerParameters {
   _NbxCountryPickerParameters({required this.isRequired, required this.inputType, required this.formType, required this.controller, this.labelText, this.hintText, this.requiredErrorMessage, this.prefixIcon}): assert(isRequired == true && requiredErrorMessage != null || isRequired == false, 'The message is necessary for required fields');
  

@override final  bool isRequired;
@override final  NbxInputType inputType;
@override final  NbxFormType formType;
@override final  TextEditingController controller;
@override final  String? labelText;
@override final  String? hintText;
@override final  String? requiredErrorMessage;
@override final  Widget? prefixIcon;

/// Create a copy of NbxCountryPickerParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbxCountryPickerParametersCopyWith<_NbxCountryPickerParameters> get copyWith => __$NbxCountryPickerParametersCopyWithImpl<_NbxCountryPickerParameters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbxCountryPickerParameters&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.inputType, inputType) || other.inputType == inputType)&&(identical(other.formType, formType) || other.formType == formType)&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.labelText, labelText) || other.labelText == labelText)&&(identical(other.hintText, hintText) || other.hintText == hintText)&&(identical(other.requiredErrorMessage, requiredErrorMessage) || other.requiredErrorMessage == requiredErrorMessage)&&(identical(other.prefixIcon, prefixIcon) || other.prefixIcon == prefixIcon));
}


@override
int get hashCode => Object.hash(runtimeType,isRequired,inputType,formType,controller,labelText,hintText,requiredErrorMessage,prefixIcon);

@override
String toString() {
  return 'NbxCountryPickerParameters(isRequired: $isRequired, inputType: $inputType, formType: $formType, controller: $controller, labelText: $labelText, hintText: $hintText, requiredErrorMessage: $requiredErrorMessage, prefixIcon: $prefixIcon)';
}


}

/// @nodoc
abstract mixin class _$NbxCountryPickerParametersCopyWith<$Res> implements $NbxCountryPickerParametersCopyWith<$Res> {
  factory _$NbxCountryPickerParametersCopyWith(_NbxCountryPickerParameters value, $Res Function(_NbxCountryPickerParameters) _then) = __$NbxCountryPickerParametersCopyWithImpl;
@override @useResult
$Res call({
 bool isRequired, NbxInputType inputType, NbxFormType formType, TextEditingController controller, String? labelText, String? hintText, String? requiredErrorMessage, Widget? prefixIcon
});




}
/// @nodoc
class __$NbxCountryPickerParametersCopyWithImpl<$Res>
    implements _$NbxCountryPickerParametersCopyWith<$Res> {
  __$NbxCountryPickerParametersCopyWithImpl(this._self, this._then);

  final _NbxCountryPickerParameters _self;
  final $Res Function(_NbxCountryPickerParameters) _then;

/// Create a copy of NbxCountryPickerParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRequired = null,Object? inputType = null,Object? formType = null,Object? controller = null,Object? labelText = freezed,Object? hintText = freezed,Object? requiredErrorMessage = freezed,Object? prefixIcon = freezed,}) {
  return _then(_NbxCountryPickerParameters(
isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,inputType: null == inputType ? _self.inputType : inputType // ignore: cast_nullable_to_non_nullable
as NbxInputType,formType: null == formType ? _self.formType : formType // ignore: cast_nullable_to_non_nullable
as NbxFormType,controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as TextEditingController,labelText: freezed == labelText ? _self.labelText : labelText // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,requiredErrorMessage: freezed == requiredErrorMessage ? _self.requiredErrorMessage : requiredErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,prefixIcon: freezed == prefixIcon ? _self.prefixIcon : prefixIcon // ignore: cast_nullable_to_non_nullable
as Widget?,
  ));
}


}

/// @nodoc
mixin _$NbxCountryPickerModalParameters {

 String get appBarTitle; Color? get countryTextColour; Color? get appBarBackgroundColour; Color? get searchBarBorderColor; Color? get searchBarTextColor; Color? get searchBarHintColor; Color get backgroundColour; Color get appBarTextColour; Color get backIconColour; Color get dividerColour; Color get searchBarBackgroundColor; Color get searchBarOuterBackgroundColor; FontStyle get appBarFontStyle; FontStyle get countryFontStyle; double get appBarFontSize; double get countryTitleSize; double get searchBarBorderWidth; bool get appBarTextCenterAlign; bool get searchBarAutofocus; bool get showSearchBox; bool get showPhoneCode; FontWeight get appBarFontWeight; FontWeight? get countryFontWeight; IconData get backIcon; IconData get searchBarIcon; List<String> get preferredCountries; ListType get listType; CountryThemeData get countryTheme; void Function(Country) get onSelect;
/// Create a copy of NbxCountryPickerModalParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbxCountryPickerModalParametersCopyWith<NbxCountryPickerModalParameters> get copyWith => _$NbxCountryPickerModalParametersCopyWithImpl<NbxCountryPickerModalParameters>(this as NbxCountryPickerModalParameters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbxCountryPickerModalParameters&&(identical(other.appBarTitle, appBarTitle) || other.appBarTitle == appBarTitle)&&(identical(other.countryTextColour, countryTextColour) || other.countryTextColour == countryTextColour)&&(identical(other.appBarBackgroundColour, appBarBackgroundColour) || other.appBarBackgroundColour == appBarBackgroundColour)&&(identical(other.searchBarBorderColor, searchBarBorderColor) || other.searchBarBorderColor == searchBarBorderColor)&&(identical(other.searchBarTextColor, searchBarTextColor) || other.searchBarTextColor == searchBarTextColor)&&(identical(other.searchBarHintColor, searchBarHintColor) || other.searchBarHintColor == searchBarHintColor)&&(identical(other.backgroundColour, backgroundColour) || other.backgroundColour == backgroundColour)&&(identical(other.appBarTextColour, appBarTextColour) || other.appBarTextColour == appBarTextColour)&&(identical(other.backIconColour, backIconColour) || other.backIconColour == backIconColour)&&(identical(other.dividerColour, dividerColour) || other.dividerColour == dividerColour)&&(identical(other.searchBarBackgroundColor, searchBarBackgroundColor) || other.searchBarBackgroundColor == searchBarBackgroundColor)&&(identical(other.searchBarOuterBackgroundColor, searchBarOuterBackgroundColor) || other.searchBarOuterBackgroundColor == searchBarOuterBackgroundColor)&&(identical(other.appBarFontStyle, appBarFontStyle) || other.appBarFontStyle == appBarFontStyle)&&(identical(other.countryFontStyle, countryFontStyle) || other.countryFontStyle == countryFontStyle)&&(identical(other.appBarFontSize, appBarFontSize) || other.appBarFontSize == appBarFontSize)&&(identical(other.countryTitleSize, countryTitleSize) || other.countryTitleSize == countryTitleSize)&&(identical(other.searchBarBorderWidth, searchBarBorderWidth) || other.searchBarBorderWidth == searchBarBorderWidth)&&(identical(other.appBarTextCenterAlign, appBarTextCenterAlign) || other.appBarTextCenterAlign == appBarTextCenterAlign)&&(identical(other.searchBarAutofocus, searchBarAutofocus) || other.searchBarAutofocus == searchBarAutofocus)&&(identical(other.showSearchBox, showSearchBox) || other.showSearchBox == showSearchBox)&&(identical(other.showPhoneCode, showPhoneCode) || other.showPhoneCode == showPhoneCode)&&(identical(other.appBarFontWeight, appBarFontWeight) || other.appBarFontWeight == appBarFontWeight)&&(identical(other.countryFontWeight, countryFontWeight) || other.countryFontWeight == countryFontWeight)&&(identical(other.backIcon, backIcon) || other.backIcon == backIcon)&&(identical(other.searchBarIcon, searchBarIcon) || other.searchBarIcon == searchBarIcon)&&const DeepCollectionEquality().equals(other.preferredCountries, preferredCountries)&&(identical(other.listType, listType) || other.listType == listType)&&(identical(other.countryTheme, countryTheme) || other.countryTheme == countryTheme)&&(identical(other.onSelect, onSelect) || other.onSelect == onSelect));
}


@override
int get hashCode => Object.hashAll([runtimeType,appBarTitle,countryTextColour,appBarBackgroundColour,searchBarBorderColor,searchBarTextColor,searchBarHintColor,backgroundColour,appBarTextColour,backIconColour,dividerColour,searchBarBackgroundColor,searchBarOuterBackgroundColor,appBarFontStyle,countryFontStyle,appBarFontSize,countryTitleSize,searchBarBorderWidth,appBarTextCenterAlign,searchBarAutofocus,showSearchBox,showPhoneCode,appBarFontWeight,countryFontWeight,backIcon,searchBarIcon,const DeepCollectionEquality().hash(preferredCountries),listType,countryTheme,onSelect]);

@override
String toString() {
  return 'NbxCountryPickerModalParameters(appBarTitle: $appBarTitle, countryTextColour: $countryTextColour, appBarBackgroundColour: $appBarBackgroundColour, searchBarBorderColor: $searchBarBorderColor, searchBarTextColor: $searchBarTextColor, searchBarHintColor: $searchBarHintColor, backgroundColour: $backgroundColour, appBarTextColour: $appBarTextColour, backIconColour: $backIconColour, dividerColour: $dividerColour, searchBarBackgroundColor: $searchBarBackgroundColor, searchBarOuterBackgroundColor: $searchBarOuterBackgroundColor, appBarFontStyle: $appBarFontStyle, countryFontStyle: $countryFontStyle, appBarFontSize: $appBarFontSize, countryTitleSize: $countryTitleSize, searchBarBorderWidth: $searchBarBorderWidth, appBarTextCenterAlign: $appBarTextCenterAlign, searchBarAutofocus: $searchBarAutofocus, showSearchBox: $showSearchBox, showPhoneCode: $showPhoneCode, appBarFontWeight: $appBarFontWeight, countryFontWeight: $countryFontWeight, backIcon: $backIcon, searchBarIcon: $searchBarIcon, preferredCountries: $preferredCountries, listType: $listType, countryTheme: $countryTheme, onSelect: $onSelect)';
}


}

/// @nodoc
abstract mixin class $NbxCountryPickerModalParametersCopyWith<$Res>  {
  factory $NbxCountryPickerModalParametersCopyWith(NbxCountryPickerModalParameters value, $Res Function(NbxCountryPickerModalParameters) _then) = _$NbxCountryPickerModalParametersCopyWithImpl;
@useResult
$Res call({
 String appBarTitle, Color? countryTextColour, Color? appBarBackgroundColour, Color? searchBarBorderColor, Color? searchBarTextColor, Color? searchBarHintColor, Color backgroundColour, Color appBarTextColour, Color backIconColour, Color dividerColour, Color searchBarBackgroundColor, Color searchBarOuterBackgroundColor, FontStyle appBarFontStyle, FontStyle countryFontStyle, double appBarFontSize, double countryTitleSize, double searchBarBorderWidth, bool appBarTextCenterAlign, bool searchBarAutofocus, bool showSearchBox, bool showPhoneCode, FontWeight appBarFontWeight, FontWeight? countryFontWeight, IconData backIcon, IconData searchBarIcon, List<String> preferredCountries, ListType listType, CountryThemeData countryTheme, void Function(Country) onSelect
});




}
/// @nodoc
class _$NbxCountryPickerModalParametersCopyWithImpl<$Res>
    implements $NbxCountryPickerModalParametersCopyWith<$Res> {
  _$NbxCountryPickerModalParametersCopyWithImpl(this._self, this._then);

  final NbxCountryPickerModalParameters _self;
  final $Res Function(NbxCountryPickerModalParameters) _then;

/// Create a copy of NbxCountryPickerModalParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appBarTitle = null,Object? countryTextColour = freezed,Object? appBarBackgroundColour = freezed,Object? searchBarBorderColor = freezed,Object? searchBarTextColor = freezed,Object? searchBarHintColor = freezed,Object? backgroundColour = null,Object? appBarTextColour = null,Object? backIconColour = null,Object? dividerColour = null,Object? searchBarBackgroundColor = null,Object? searchBarOuterBackgroundColor = null,Object? appBarFontStyle = null,Object? countryFontStyle = null,Object? appBarFontSize = null,Object? countryTitleSize = null,Object? searchBarBorderWidth = null,Object? appBarTextCenterAlign = null,Object? searchBarAutofocus = null,Object? showSearchBox = null,Object? showPhoneCode = null,Object? appBarFontWeight = null,Object? countryFontWeight = freezed,Object? backIcon = null,Object? searchBarIcon = null,Object? preferredCountries = null,Object? listType = null,Object? countryTheme = null,Object? onSelect = null,}) {
  return _then(_self.copyWith(
appBarTitle: null == appBarTitle ? _self.appBarTitle : appBarTitle // ignore: cast_nullable_to_non_nullable
as String,countryTextColour: freezed == countryTextColour ? _self.countryTextColour : countryTextColour // ignore: cast_nullable_to_non_nullable
as Color?,appBarBackgroundColour: freezed == appBarBackgroundColour ? _self.appBarBackgroundColour : appBarBackgroundColour // ignore: cast_nullable_to_non_nullable
as Color?,searchBarBorderColor: freezed == searchBarBorderColor ? _self.searchBarBorderColor : searchBarBorderColor // ignore: cast_nullable_to_non_nullable
as Color?,searchBarTextColor: freezed == searchBarTextColor ? _self.searchBarTextColor : searchBarTextColor // ignore: cast_nullable_to_non_nullable
as Color?,searchBarHintColor: freezed == searchBarHintColor ? _self.searchBarHintColor : searchBarHintColor // ignore: cast_nullable_to_non_nullable
as Color?,backgroundColour: null == backgroundColour ? _self.backgroundColour : backgroundColour // ignore: cast_nullable_to_non_nullable
as Color,appBarTextColour: null == appBarTextColour ? _self.appBarTextColour : appBarTextColour // ignore: cast_nullable_to_non_nullable
as Color,backIconColour: null == backIconColour ? _self.backIconColour : backIconColour // ignore: cast_nullable_to_non_nullable
as Color,dividerColour: null == dividerColour ? _self.dividerColour : dividerColour // ignore: cast_nullable_to_non_nullable
as Color,searchBarBackgroundColor: null == searchBarBackgroundColor ? _self.searchBarBackgroundColor : searchBarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,searchBarOuterBackgroundColor: null == searchBarOuterBackgroundColor ? _self.searchBarOuterBackgroundColor : searchBarOuterBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,appBarFontStyle: null == appBarFontStyle ? _self.appBarFontStyle : appBarFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle,countryFontStyle: null == countryFontStyle ? _self.countryFontStyle : countryFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle,appBarFontSize: null == appBarFontSize ? _self.appBarFontSize : appBarFontSize // ignore: cast_nullable_to_non_nullable
as double,countryTitleSize: null == countryTitleSize ? _self.countryTitleSize : countryTitleSize // ignore: cast_nullable_to_non_nullable
as double,searchBarBorderWidth: null == searchBarBorderWidth ? _self.searchBarBorderWidth : searchBarBorderWidth // ignore: cast_nullable_to_non_nullable
as double,appBarTextCenterAlign: null == appBarTextCenterAlign ? _self.appBarTextCenterAlign : appBarTextCenterAlign // ignore: cast_nullable_to_non_nullable
as bool,searchBarAutofocus: null == searchBarAutofocus ? _self.searchBarAutofocus : searchBarAutofocus // ignore: cast_nullable_to_non_nullable
as bool,showSearchBox: null == showSearchBox ? _self.showSearchBox : showSearchBox // ignore: cast_nullable_to_non_nullable
as bool,showPhoneCode: null == showPhoneCode ? _self.showPhoneCode : showPhoneCode // ignore: cast_nullable_to_non_nullable
as bool,appBarFontWeight: null == appBarFontWeight ? _self.appBarFontWeight : appBarFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight,countryFontWeight: freezed == countryFontWeight ? _self.countryFontWeight : countryFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,backIcon: null == backIcon ? _self.backIcon : backIcon // ignore: cast_nullable_to_non_nullable
as IconData,searchBarIcon: null == searchBarIcon ? _self.searchBarIcon : searchBarIcon // ignore: cast_nullable_to_non_nullable
as IconData,preferredCountries: null == preferredCountries ? _self.preferredCountries : preferredCountries // ignore: cast_nullable_to_non_nullable
as List<String>,listType: null == listType ? _self.listType : listType // ignore: cast_nullable_to_non_nullable
as ListType,countryTheme: null == countryTheme ? _self.countryTheme : countryTheme // ignore: cast_nullable_to_non_nullable
as CountryThemeData,onSelect: null == onSelect ? _self.onSelect : onSelect // ignore: cast_nullable_to_non_nullable
as void Function(Country),
  ));
}

}


/// Adds pattern-matching-related methods to [NbxCountryPickerModalParameters].
extension NbxCountryPickerModalParametersPatterns on NbxCountryPickerModalParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbxCountryPickerModalParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbxCountryPickerModalParameters value)  $default,){
final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbxCountryPickerModalParameters value)?  $default,){
final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appBarTitle,  Color? countryTextColour,  Color? appBarBackgroundColour,  Color? searchBarBorderColor,  Color? searchBarTextColor,  Color? searchBarHintColor,  Color backgroundColour,  Color appBarTextColour,  Color backIconColour,  Color dividerColour,  Color searchBarBackgroundColor,  Color searchBarOuterBackgroundColor,  FontStyle appBarFontStyle,  FontStyle countryFontStyle,  double appBarFontSize,  double countryTitleSize,  double searchBarBorderWidth,  bool appBarTextCenterAlign,  bool searchBarAutofocus,  bool showSearchBox,  bool showPhoneCode,  FontWeight appBarFontWeight,  FontWeight? countryFontWeight,  IconData backIcon,  IconData searchBarIcon,  List<String> preferredCountries,  ListType listType,  CountryThemeData countryTheme,  void Function(Country) onSelect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters() when $default != null:
return $default(_that.appBarTitle,_that.countryTextColour,_that.appBarBackgroundColour,_that.searchBarBorderColor,_that.searchBarTextColor,_that.searchBarHintColor,_that.backgroundColour,_that.appBarTextColour,_that.backIconColour,_that.dividerColour,_that.searchBarBackgroundColor,_that.searchBarOuterBackgroundColor,_that.appBarFontStyle,_that.countryFontStyle,_that.appBarFontSize,_that.countryTitleSize,_that.searchBarBorderWidth,_that.appBarTextCenterAlign,_that.searchBarAutofocus,_that.showSearchBox,_that.showPhoneCode,_that.appBarFontWeight,_that.countryFontWeight,_that.backIcon,_that.searchBarIcon,_that.preferredCountries,_that.listType,_that.countryTheme,_that.onSelect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appBarTitle,  Color? countryTextColour,  Color? appBarBackgroundColour,  Color? searchBarBorderColor,  Color? searchBarTextColor,  Color? searchBarHintColor,  Color backgroundColour,  Color appBarTextColour,  Color backIconColour,  Color dividerColour,  Color searchBarBackgroundColor,  Color searchBarOuterBackgroundColor,  FontStyle appBarFontStyle,  FontStyle countryFontStyle,  double appBarFontSize,  double countryTitleSize,  double searchBarBorderWidth,  bool appBarTextCenterAlign,  bool searchBarAutofocus,  bool showSearchBox,  bool showPhoneCode,  FontWeight appBarFontWeight,  FontWeight? countryFontWeight,  IconData backIcon,  IconData searchBarIcon,  List<String> preferredCountries,  ListType listType,  CountryThemeData countryTheme,  void Function(Country) onSelect)  $default,) {final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters():
return $default(_that.appBarTitle,_that.countryTextColour,_that.appBarBackgroundColour,_that.searchBarBorderColor,_that.searchBarTextColor,_that.searchBarHintColor,_that.backgroundColour,_that.appBarTextColour,_that.backIconColour,_that.dividerColour,_that.searchBarBackgroundColor,_that.searchBarOuterBackgroundColor,_that.appBarFontStyle,_that.countryFontStyle,_that.appBarFontSize,_that.countryTitleSize,_that.searchBarBorderWidth,_that.appBarTextCenterAlign,_that.searchBarAutofocus,_that.showSearchBox,_that.showPhoneCode,_that.appBarFontWeight,_that.countryFontWeight,_that.backIcon,_that.searchBarIcon,_that.preferredCountries,_that.listType,_that.countryTheme,_that.onSelect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appBarTitle,  Color? countryTextColour,  Color? appBarBackgroundColour,  Color? searchBarBorderColor,  Color? searchBarTextColor,  Color? searchBarHintColor,  Color backgroundColour,  Color appBarTextColour,  Color backIconColour,  Color dividerColour,  Color searchBarBackgroundColor,  Color searchBarOuterBackgroundColor,  FontStyle appBarFontStyle,  FontStyle countryFontStyle,  double appBarFontSize,  double countryTitleSize,  double searchBarBorderWidth,  bool appBarTextCenterAlign,  bool searchBarAutofocus,  bool showSearchBox,  bool showPhoneCode,  FontWeight appBarFontWeight,  FontWeight? countryFontWeight,  IconData backIcon,  IconData searchBarIcon,  List<String> preferredCountries,  ListType listType,  CountryThemeData countryTheme,  void Function(Country) onSelect)?  $default,) {final _that = this;
switch (_that) {
case _NbxCountryPickerModalParameters() when $default != null:
return $default(_that.appBarTitle,_that.countryTextColour,_that.appBarBackgroundColour,_that.searchBarBorderColor,_that.searchBarTextColor,_that.searchBarHintColor,_that.backgroundColour,_that.appBarTextColour,_that.backIconColour,_that.dividerColour,_that.searchBarBackgroundColor,_that.searchBarOuterBackgroundColor,_that.appBarFontStyle,_that.countryFontStyle,_that.appBarFontSize,_that.countryTitleSize,_that.searchBarBorderWidth,_that.appBarTextCenterAlign,_that.searchBarAutofocus,_that.showSearchBox,_that.showPhoneCode,_that.appBarFontWeight,_that.countryFontWeight,_that.backIcon,_that.searchBarIcon,_that.preferredCountries,_that.listType,_that.countryTheme,_that.onSelect);case _:
  return null;

}
}

}

/// @nodoc


class _NbxCountryPickerModalParameters implements NbxCountryPickerModalParameters {
   _NbxCountryPickerModalParameters({required this.appBarTitle, this.countryTextColour, this.appBarBackgroundColour, this.searchBarBorderColor, this.searchBarTextColor, this.searchBarHintColor, this.backgroundColour = Colors.white, this.appBarTextColour = Colors.white, this.backIconColour = Colors.white, this.dividerColour = Colors.black12, this.searchBarBackgroundColor = Colors.white, this.searchBarOuterBackgroundColor = Colors.white, this.appBarFontStyle = FontStyle.normal, this.countryFontStyle = FontStyle.normal, this.appBarFontSize = 20, this.countryTitleSize = 16, this.searchBarBorderWidth = .5, this.appBarTextCenterAlign = true, this.searchBarAutofocus = false, this.showSearchBox = true, this.showPhoneCode = false, this.appBarFontWeight = FontWeight.bold, this.countryFontWeight = FontWeight.bold, this.backIcon = Icons.arrow_back, this.searchBarIcon = Icons.search, final  List<String> preferredCountries = const <String>['US'], this.listType = ListType.list, this.countryTheme = const CountryThemeData(appBarBorderRadius: 10), required this.onSelect}): _preferredCountries = preferredCountries;
  

@override final  String appBarTitle;
@override final  Color? countryTextColour;
@override final  Color? appBarBackgroundColour;
@override final  Color? searchBarBorderColor;
@override final  Color? searchBarTextColor;
@override final  Color? searchBarHintColor;
@override@JsonKey() final  Color backgroundColour;
@override@JsonKey() final  Color appBarTextColour;
@override@JsonKey() final  Color backIconColour;
@override@JsonKey() final  Color dividerColour;
@override@JsonKey() final  Color searchBarBackgroundColor;
@override@JsonKey() final  Color searchBarOuterBackgroundColor;
@override@JsonKey() final  FontStyle appBarFontStyle;
@override@JsonKey() final  FontStyle countryFontStyle;
@override@JsonKey() final  double appBarFontSize;
@override@JsonKey() final  double countryTitleSize;
@override@JsonKey() final  double searchBarBorderWidth;
@override@JsonKey() final  bool appBarTextCenterAlign;
@override@JsonKey() final  bool searchBarAutofocus;
@override@JsonKey() final  bool showSearchBox;
@override@JsonKey() final  bool showPhoneCode;
@override@JsonKey() final  FontWeight appBarFontWeight;
@override@JsonKey() final  FontWeight? countryFontWeight;
@override@JsonKey() final  IconData backIcon;
@override@JsonKey() final  IconData searchBarIcon;
 final  List<String> _preferredCountries;
@override@JsonKey() List<String> get preferredCountries {
  if (_preferredCountries is EqualUnmodifiableListView) return _preferredCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredCountries);
}

@override@JsonKey() final  ListType listType;
@override@JsonKey() final  CountryThemeData countryTheme;
@override final  void Function(Country) onSelect;

/// Create a copy of NbxCountryPickerModalParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbxCountryPickerModalParametersCopyWith<_NbxCountryPickerModalParameters> get copyWith => __$NbxCountryPickerModalParametersCopyWithImpl<_NbxCountryPickerModalParameters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbxCountryPickerModalParameters&&(identical(other.appBarTitle, appBarTitle) || other.appBarTitle == appBarTitle)&&(identical(other.countryTextColour, countryTextColour) || other.countryTextColour == countryTextColour)&&(identical(other.appBarBackgroundColour, appBarBackgroundColour) || other.appBarBackgroundColour == appBarBackgroundColour)&&(identical(other.searchBarBorderColor, searchBarBorderColor) || other.searchBarBorderColor == searchBarBorderColor)&&(identical(other.searchBarTextColor, searchBarTextColor) || other.searchBarTextColor == searchBarTextColor)&&(identical(other.searchBarHintColor, searchBarHintColor) || other.searchBarHintColor == searchBarHintColor)&&(identical(other.backgroundColour, backgroundColour) || other.backgroundColour == backgroundColour)&&(identical(other.appBarTextColour, appBarTextColour) || other.appBarTextColour == appBarTextColour)&&(identical(other.backIconColour, backIconColour) || other.backIconColour == backIconColour)&&(identical(other.dividerColour, dividerColour) || other.dividerColour == dividerColour)&&(identical(other.searchBarBackgroundColor, searchBarBackgroundColor) || other.searchBarBackgroundColor == searchBarBackgroundColor)&&(identical(other.searchBarOuterBackgroundColor, searchBarOuterBackgroundColor) || other.searchBarOuterBackgroundColor == searchBarOuterBackgroundColor)&&(identical(other.appBarFontStyle, appBarFontStyle) || other.appBarFontStyle == appBarFontStyle)&&(identical(other.countryFontStyle, countryFontStyle) || other.countryFontStyle == countryFontStyle)&&(identical(other.appBarFontSize, appBarFontSize) || other.appBarFontSize == appBarFontSize)&&(identical(other.countryTitleSize, countryTitleSize) || other.countryTitleSize == countryTitleSize)&&(identical(other.searchBarBorderWidth, searchBarBorderWidth) || other.searchBarBorderWidth == searchBarBorderWidth)&&(identical(other.appBarTextCenterAlign, appBarTextCenterAlign) || other.appBarTextCenterAlign == appBarTextCenterAlign)&&(identical(other.searchBarAutofocus, searchBarAutofocus) || other.searchBarAutofocus == searchBarAutofocus)&&(identical(other.showSearchBox, showSearchBox) || other.showSearchBox == showSearchBox)&&(identical(other.showPhoneCode, showPhoneCode) || other.showPhoneCode == showPhoneCode)&&(identical(other.appBarFontWeight, appBarFontWeight) || other.appBarFontWeight == appBarFontWeight)&&(identical(other.countryFontWeight, countryFontWeight) || other.countryFontWeight == countryFontWeight)&&(identical(other.backIcon, backIcon) || other.backIcon == backIcon)&&(identical(other.searchBarIcon, searchBarIcon) || other.searchBarIcon == searchBarIcon)&&const DeepCollectionEquality().equals(other._preferredCountries, _preferredCountries)&&(identical(other.listType, listType) || other.listType == listType)&&(identical(other.countryTheme, countryTheme) || other.countryTheme == countryTheme)&&(identical(other.onSelect, onSelect) || other.onSelect == onSelect));
}


@override
int get hashCode => Object.hashAll([runtimeType,appBarTitle,countryTextColour,appBarBackgroundColour,searchBarBorderColor,searchBarTextColor,searchBarHintColor,backgroundColour,appBarTextColour,backIconColour,dividerColour,searchBarBackgroundColor,searchBarOuterBackgroundColor,appBarFontStyle,countryFontStyle,appBarFontSize,countryTitleSize,searchBarBorderWidth,appBarTextCenterAlign,searchBarAutofocus,showSearchBox,showPhoneCode,appBarFontWeight,countryFontWeight,backIcon,searchBarIcon,const DeepCollectionEquality().hash(_preferredCountries),listType,countryTheme,onSelect]);

@override
String toString() {
  return 'NbxCountryPickerModalParameters(appBarTitle: $appBarTitle, countryTextColour: $countryTextColour, appBarBackgroundColour: $appBarBackgroundColour, searchBarBorderColor: $searchBarBorderColor, searchBarTextColor: $searchBarTextColor, searchBarHintColor: $searchBarHintColor, backgroundColour: $backgroundColour, appBarTextColour: $appBarTextColour, backIconColour: $backIconColour, dividerColour: $dividerColour, searchBarBackgroundColor: $searchBarBackgroundColor, searchBarOuterBackgroundColor: $searchBarOuterBackgroundColor, appBarFontStyle: $appBarFontStyle, countryFontStyle: $countryFontStyle, appBarFontSize: $appBarFontSize, countryTitleSize: $countryTitleSize, searchBarBorderWidth: $searchBarBorderWidth, appBarTextCenterAlign: $appBarTextCenterAlign, searchBarAutofocus: $searchBarAutofocus, showSearchBox: $showSearchBox, showPhoneCode: $showPhoneCode, appBarFontWeight: $appBarFontWeight, countryFontWeight: $countryFontWeight, backIcon: $backIcon, searchBarIcon: $searchBarIcon, preferredCountries: $preferredCountries, listType: $listType, countryTheme: $countryTheme, onSelect: $onSelect)';
}


}

/// @nodoc
abstract mixin class _$NbxCountryPickerModalParametersCopyWith<$Res> implements $NbxCountryPickerModalParametersCopyWith<$Res> {
  factory _$NbxCountryPickerModalParametersCopyWith(_NbxCountryPickerModalParameters value, $Res Function(_NbxCountryPickerModalParameters) _then) = __$NbxCountryPickerModalParametersCopyWithImpl;
@override @useResult
$Res call({
 String appBarTitle, Color? countryTextColour, Color? appBarBackgroundColour, Color? searchBarBorderColor, Color? searchBarTextColor, Color? searchBarHintColor, Color backgroundColour, Color appBarTextColour, Color backIconColour, Color dividerColour, Color searchBarBackgroundColor, Color searchBarOuterBackgroundColor, FontStyle appBarFontStyle, FontStyle countryFontStyle, double appBarFontSize, double countryTitleSize, double searchBarBorderWidth, bool appBarTextCenterAlign, bool searchBarAutofocus, bool showSearchBox, bool showPhoneCode, FontWeight appBarFontWeight, FontWeight? countryFontWeight, IconData backIcon, IconData searchBarIcon, List<String> preferredCountries, ListType listType, CountryThemeData countryTheme, void Function(Country) onSelect
});




}
/// @nodoc
class __$NbxCountryPickerModalParametersCopyWithImpl<$Res>
    implements _$NbxCountryPickerModalParametersCopyWith<$Res> {
  __$NbxCountryPickerModalParametersCopyWithImpl(this._self, this._then);

  final _NbxCountryPickerModalParameters _self;
  final $Res Function(_NbxCountryPickerModalParameters) _then;

/// Create a copy of NbxCountryPickerModalParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appBarTitle = null,Object? countryTextColour = freezed,Object? appBarBackgroundColour = freezed,Object? searchBarBorderColor = freezed,Object? searchBarTextColor = freezed,Object? searchBarHintColor = freezed,Object? backgroundColour = null,Object? appBarTextColour = null,Object? backIconColour = null,Object? dividerColour = null,Object? searchBarBackgroundColor = null,Object? searchBarOuterBackgroundColor = null,Object? appBarFontStyle = null,Object? countryFontStyle = null,Object? appBarFontSize = null,Object? countryTitleSize = null,Object? searchBarBorderWidth = null,Object? appBarTextCenterAlign = null,Object? searchBarAutofocus = null,Object? showSearchBox = null,Object? showPhoneCode = null,Object? appBarFontWeight = null,Object? countryFontWeight = freezed,Object? backIcon = null,Object? searchBarIcon = null,Object? preferredCountries = null,Object? listType = null,Object? countryTheme = null,Object? onSelect = null,}) {
  return _then(_NbxCountryPickerModalParameters(
appBarTitle: null == appBarTitle ? _self.appBarTitle : appBarTitle // ignore: cast_nullable_to_non_nullable
as String,countryTextColour: freezed == countryTextColour ? _self.countryTextColour : countryTextColour // ignore: cast_nullable_to_non_nullable
as Color?,appBarBackgroundColour: freezed == appBarBackgroundColour ? _self.appBarBackgroundColour : appBarBackgroundColour // ignore: cast_nullable_to_non_nullable
as Color?,searchBarBorderColor: freezed == searchBarBorderColor ? _self.searchBarBorderColor : searchBarBorderColor // ignore: cast_nullable_to_non_nullable
as Color?,searchBarTextColor: freezed == searchBarTextColor ? _self.searchBarTextColor : searchBarTextColor // ignore: cast_nullable_to_non_nullable
as Color?,searchBarHintColor: freezed == searchBarHintColor ? _self.searchBarHintColor : searchBarHintColor // ignore: cast_nullable_to_non_nullable
as Color?,backgroundColour: null == backgroundColour ? _self.backgroundColour : backgroundColour // ignore: cast_nullable_to_non_nullable
as Color,appBarTextColour: null == appBarTextColour ? _self.appBarTextColour : appBarTextColour // ignore: cast_nullable_to_non_nullable
as Color,backIconColour: null == backIconColour ? _self.backIconColour : backIconColour // ignore: cast_nullable_to_non_nullable
as Color,dividerColour: null == dividerColour ? _self.dividerColour : dividerColour // ignore: cast_nullable_to_non_nullable
as Color,searchBarBackgroundColor: null == searchBarBackgroundColor ? _self.searchBarBackgroundColor : searchBarBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,searchBarOuterBackgroundColor: null == searchBarOuterBackgroundColor ? _self.searchBarOuterBackgroundColor : searchBarOuterBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,appBarFontStyle: null == appBarFontStyle ? _self.appBarFontStyle : appBarFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle,countryFontStyle: null == countryFontStyle ? _self.countryFontStyle : countryFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle,appBarFontSize: null == appBarFontSize ? _self.appBarFontSize : appBarFontSize // ignore: cast_nullable_to_non_nullable
as double,countryTitleSize: null == countryTitleSize ? _self.countryTitleSize : countryTitleSize // ignore: cast_nullable_to_non_nullable
as double,searchBarBorderWidth: null == searchBarBorderWidth ? _self.searchBarBorderWidth : searchBarBorderWidth // ignore: cast_nullable_to_non_nullable
as double,appBarTextCenterAlign: null == appBarTextCenterAlign ? _self.appBarTextCenterAlign : appBarTextCenterAlign // ignore: cast_nullable_to_non_nullable
as bool,searchBarAutofocus: null == searchBarAutofocus ? _self.searchBarAutofocus : searchBarAutofocus // ignore: cast_nullable_to_non_nullable
as bool,showSearchBox: null == showSearchBox ? _self.showSearchBox : showSearchBox // ignore: cast_nullable_to_non_nullable
as bool,showPhoneCode: null == showPhoneCode ? _self.showPhoneCode : showPhoneCode // ignore: cast_nullable_to_non_nullable
as bool,appBarFontWeight: null == appBarFontWeight ? _self.appBarFontWeight : appBarFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight,countryFontWeight: freezed == countryFontWeight ? _self.countryFontWeight : countryFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,backIcon: null == backIcon ? _self.backIcon : backIcon // ignore: cast_nullable_to_non_nullable
as IconData,searchBarIcon: null == searchBarIcon ? _self.searchBarIcon : searchBarIcon // ignore: cast_nullable_to_non_nullable
as IconData,preferredCountries: null == preferredCountries ? _self._preferredCountries : preferredCountries // ignore: cast_nullable_to_non_nullable
as List<String>,listType: null == listType ? _self.listType : listType // ignore: cast_nullable_to_non_nullable
as ListType,countryTheme: null == countryTheme ? _self.countryTheme : countryTheme // ignore: cast_nullable_to_non_nullable
as CountryThemeData,onSelect: null == onSelect ? _self.onSelect : onSelect // ignore: cast_nullable_to_non_nullable
as void Function(Country),
  ));
}


}

// dart format on
