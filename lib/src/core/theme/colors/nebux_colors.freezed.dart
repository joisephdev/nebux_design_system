// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nebux_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NebuxColors {

/// Primary brand color - used for main actions and branding
@ColorConverter() Color get primary;/// Secondary color - used for secondary actions
@ColorConverter() Color get secondary;/// Secondary variant color - darker shade of secondary
@ColorConverter() Color get secondaryVariant;/// Background color
@ColorConverter() Color get background;/// Surface color - for cards and elevated surfaces
@ColorConverter() Color get surface;/// Text primary color
@ColorConverter() Color get textPrimary;/// Text secondary color
@ColorConverter() Color get textSecondary;/// Action primary color
@ColorConverter() Color get actionPrimary;/// Action secondary color
@ColorConverter() Color get actionSecondary;/// Card color
@ColorConverter() Color get cardColor;/// Divider color
@ColorConverter() Color get divider;/// Overlay color - for scrim and modal backdrop
@ColorConverter() Color get overlay;/// Focus color - for focus rings and accessibility
@ColorConverter() Color get focus;/// Success color - for positive actions and states
@ColorConverter() Color get success;/// Warning color - for caution states
@ColorConverter() Color get warning;/// Error color - for error states
@ColorConverter() Color get error;/// Info color - for informational states
@ColorConverter() Color get info;/// Disabled color - for disabled states
@ColorConverter() Color get disabled;/// White color
@ColorConverter() Color get white;/// Black color
@ColorConverter() Color get black;/// Primary gradient - from primary to secondary
@LinearGradientConverter() LinearGradient get primaryGradient;/// Secondary gradient - from secondary to accent
@LinearGradientConverter() LinearGradient get secondaryGradient;
/// Create a copy of NebuxColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NebuxColorsCopyWith<NebuxColors> get copyWith => _$NebuxColorsCopyWithImpl<NebuxColors>(this as NebuxColors, _$identity);

  /// Serializes this NebuxColors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NebuxColors&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.secondaryVariant, secondaryVariant) || other.secondaryVariant == secondaryVariant)&&(identical(other.background, background) || other.background == background)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.textPrimary, textPrimary) || other.textPrimary == textPrimary)&&(identical(other.textSecondary, textSecondary) || other.textSecondary == textSecondary)&&(identical(other.actionPrimary, actionPrimary) || other.actionPrimary == actionPrimary)&&(identical(other.actionSecondary, actionSecondary) || other.actionSecondary == actionSecondary)&&(identical(other.cardColor, cardColor) || other.cardColor == cardColor)&&(identical(other.divider, divider) || other.divider == divider)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.focus, focus) || other.focus == focus)&&(identical(other.success, success) || other.success == success)&&(identical(other.warning, warning) || other.warning == warning)&&(identical(other.error, error) || other.error == error)&&(identical(other.info, info) || other.info == info)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.white, white) || other.white == white)&&(identical(other.black, black) || other.black == black)&&(identical(other.primaryGradient, primaryGradient) || other.primaryGradient == primaryGradient)&&(identical(other.secondaryGradient, secondaryGradient) || other.secondaryGradient == secondaryGradient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,secondary,secondaryVariant,background,surface,textPrimary,textSecondary,actionPrimary,actionSecondary,cardColor,divider,overlay,focus,success,warning,error,info,disabled,white,black,primaryGradient,secondaryGradient]);

@override
String toString() {
  return 'NebuxColors(primary: $primary, secondary: $secondary, secondaryVariant: $secondaryVariant, background: $background, surface: $surface, textPrimary: $textPrimary, textSecondary: $textSecondary, actionPrimary: $actionPrimary, actionSecondary: $actionSecondary, cardColor: $cardColor, divider: $divider, overlay: $overlay, focus: $focus, success: $success, warning: $warning, error: $error, info: $info, disabled: $disabled, white: $white, black: $black, primaryGradient: $primaryGradient, secondaryGradient: $secondaryGradient)';
}


}

/// @nodoc
abstract mixin class $NebuxColorsCopyWith<$Res>  {
  factory $NebuxColorsCopyWith(NebuxColors value, $Res Function(NebuxColors) _then) = _$NebuxColorsCopyWithImpl;
@useResult
$Res call({
@ColorConverter() Color primary,@ColorConverter() Color secondary,@ColorConverter() Color secondaryVariant,@ColorConverter() Color background,@ColorConverter() Color surface,@ColorConverter() Color textPrimary,@ColorConverter() Color textSecondary,@ColorConverter() Color actionPrimary,@ColorConverter() Color actionSecondary,@ColorConverter() Color cardColor,@ColorConverter() Color divider,@ColorConverter() Color overlay,@ColorConverter() Color focus,@ColorConverter() Color success,@ColorConverter() Color warning,@ColorConverter() Color error,@ColorConverter() Color info,@ColorConverter() Color disabled,@ColorConverter() Color white,@ColorConverter() Color black,@LinearGradientConverter() LinearGradient primaryGradient,@LinearGradientConverter() LinearGradient secondaryGradient
});




}
/// @nodoc
class _$NebuxColorsCopyWithImpl<$Res>
    implements $NebuxColorsCopyWith<$Res> {
  _$NebuxColorsCopyWithImpl(this._self, this._then);

  final NebuxColors _self;
  final $Res Function(NebuxColors) _then;

/// Create a copy of NebuxColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? secondary = null,Object? secondaryVariant = null,Object? background = null,Object? surface = null,Object? textPrimary = null,Object? textSecondary = null,Object? actionPrimary = null,Object? actionSecondary = null,Object? cardColor = null,Object? divider = null,Object? overlay = null,Object? focus = null,Object? success = null,Object? warning = null,Object? error = null,Object? info = null,Object? disabled = null,Object? white = null,Object? black = null,Object? primaryGradient = null,Object? secondaryGradient = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,secondaryVariant: null == secondaryVariant ? _self.secondaryVariant : secondaryVariant // ignore: cast_nullable_to_non_nullable
as Color,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color,textPrimary: null == textPrimary ? _self.textPrimary : textPrimary // ignore: cast_nullable_to_non_nullable
as Color,textSecondary: null == textSecondary ? _self.textSecondary : textSecondary // ignore: cast_nullable_to_non_nullable
as Color,actionPrimary: null == actionPrimary ? _self.actionPrimary : actionPrimary // ignore: cast_nullable_to_non_nullable
as Color,actionSecondary: null == actionSecondary ? _self.actionSecondary : actionSecondary // ignore: cast_nullable_to_non_nullable
as Color,cardColor: null == cardColor ? _self.cardColor : cardColor // ignore: cast_nullable_to_non_nullable
as Color,divider: null == divider ? _self.divider : divider // ignore: cast_nullable_to_non_nullable
as Color,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Color,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as Color,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as Color,warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as Color,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Color,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as Color,white: null == white ? _self.white : white // ignore: cast_nullable_to_non_nullable
as Color,black: null == black ? _self.black : black // ignore: cast_nullable_to_non_nullable
as Color,primaryGradient: null == primaryGradient ? _self.primaryGradient : primaryGradient // ignore: cast_nullable_to_non_nullable
as LinearGradient,secondaryGradient: null == secondaryGradient ? _self.secondaryGradient : secondaryGradient // ignore: cast_nullable_to_non_nullable
as LinearGradient,
  ));
}

}


/// Adds pattern-matching-related methods to [NebuxColors].
extension NebuxColorsPatterns on NebuxColors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NebuxColors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NebuxColors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NebuxColors value)  $default,){
final _that = this;
switch (_that) {
case _NebuxColors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NebuxColors value)?  $default,){
final _that = this;
switch (_that) {
case _NebuxColors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ColorConverter()  Color primary, @ColorConverter()  Color secondary, @ColorConverter()  Color secondaryVariant, @ColorConverter()  Color background, @ColorConverter()  Color surface, @ColorConverter()  Color textPrimary, @ColorConverter()  Color textSecondary, @ColorConverter()  Color actionPrimary, @ColorConverter()  Color actionSecondary, @ColorConverter()  Color cardColor, @ColorConverter()  Color divider, @ColorConverter()  Color overlay, @ColorConverter()  Color focus, @ColorConverter()  Color success, @ColorConverter()  Color warning, @ColorConverter()  Color error, @ColorConverter()  Color info, @ColorConverter()  Color disabled, @ColorConverter()  Color white, @ColorConverter()  Color black, @LinearGradientConverter()  LinearGradient primaryGradient, @LinearGradientConverter()  LinearGradient secondaryGradient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NebuxColors() when $default != null:
return $default(_that.primary,_that.secondary,_that.secondaryVariant,_that.background,_that.surface,_that.textPrimary,_that.textSecondary,_that.actionPrimary,_that.actionSecondary,_that.cardColor,_that.divider,_that.overlay,_that.focus,_that.success,_that.warning,_that.error,_that.info,_that.disabled,_that.white,_that.black,_that.primaryGradient,_that.secondaryGradient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ColorConverter()  Color primary, @ColorConverter()  Color secondary, @ColorConverter()  Color secondaryVariant, @ColorConverter()  Color background, @ColorConverter()  Color surface, @ColorConverter()  Color textPrimary, @ColorConverter()  Color textSecondary, @ColorConverter()  Color actionPrimary, @ColorConverter()  Color actionSecondary, @ColorConverter()  Color cardColor, @ColorConverter()  Color divider, @ColorConverter()  Color overlay, @ColorConverter()  Color focus, @ColorConverter()  Color success, @ColorConverter()  Color warning, @ColorConverter()  Color error, @ColorConverter()  Color info, @ColorConverter()  Color disabled, @ColorConverter()  Color white, @ColorConverter()  Color black, @LinearGradientConverter()  LinearGradient primaryGradient, @LinearGradientConverter()  LinearGradient secondaryGradient)  $default,) {final _that = this;
switch (_that) {
case _NebuxColors():
return $default(_that.primary,_that.secondary,_that.secondaryVariant,_that.background,_that.surface,_that.textPrimary,_that.textSecondary,_that.actionPrimary,_that.actionSecondary,_that.cardColor,_that.divider,_that.overlay,_that.focus,_that.success,_that.warning,_that.error,_that.info,_that.disabled,_that.white,_that.black,_that.primaryGradient,_that.secondaryGradient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ColorConverter()  Color primary, @ColorConverter()  Color secondary, @ColorConverter()  Color secondaryVariant, @ColorConverter()  Color background, @ColorConverter()  Color surface, @ColorConverter()  Color textPrimary, @ColorConverter()  Color textSecondary, @ColorConverter()  Color actionPrimary, @ColorConverter()  Color actionSecondary, @ColorConverter()  Color cardColor, @ColorConverter()  Color divider, @ColorConverter()  Color overlay, @ColorConverter()  Color focus, @ColorConverter()  Color success, @ColorConverter()  Color warning, @ColorConverter()  Color error, @ColorConverter()  Color info, @ColorConverter()  Color disabled, @ColorConverter()  Color white, @ColorConverter()  Color black, @LinearGradientConverter()  LinearGradient primaryGradient, @LinearGradientConverter()  LinearGradient secondaryGradient)?  $default,) {final _that = this;
switch (_that) {
case _NebuxColors() when $default != null:
return $default(_that.primary,_that.secondary,_that.secondaryVariant,_that.background,_that.surface,_that.textPrimary,_that.textSecondary,_that.actionPrimary,_that.actionSecondary,_that.cardColor,_that.divider,_that.overlay,_that.focus,_that.success,_that.warning,_that.error,_that.info,_that.disabled,_that.white,_that.black,_that.primaryGradient,_that.secondaryGradient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NebuxColors extends NebuxColors {
  const _NebuxColors({@ColorConverter() required this.primary, @ColorConverter() required this.secondary, @ColorConverter() required this.secondaryVariant, @ColorConverter() required this.background, @ColorConverter() required this.surface, @ColorConverter() required this.textPrimary, @ColorConverter() required this.textSecondary, @ColorConverter() required this.actionPrimary, @ColorConverter() required this.actionSecondary, @ColorConverter() required this.cardColor, @ColorConverter() required this.divider, @ColorConverter() required this.overlay, @ColorConverter() required this.focus, @ColorConverter() required this.success, @ColorConverter() required this.warning, @ColorConverter() required this.error, @ColorConverter() required this.info, @ColorConverter() required this.disabled, @ColorConverter() required this.white, @ColorConverter() required this.black, @LinearGradientConverter() required this.primaryGradient, @LinearGradientConverter() required this.secondaryGradient}): super._();
  factory _NebuxColors.fromJson(Map<String, dynamic> json) => _$NebuxColorsFromJson(json);

/// Primary brand color - used for main actions and branding
@override@ColorConverter() final  Color primary;
/// Secondary color - used for secondary actions
@override@ColorConverter() final  Color secondary;
/// Secondary variant color - darker shade of secondary
@override@ColorConverter() final  Color secondaryVariant;
/// Background color
@override@ColorConverter() final  Color background;
/// Surface color - for cards and elevated surfaces
@override@ColorConverter() final  Color surface;
/// Text primary color
@override@ColorConverter() final  Color textPrimary;
/// Text secondary color
@override@ColorConverter() final  Color textSecondary;
/// Action primary color
@override@ColorConverter() final  Color actionPrimary;
/// Action secondary color
@override@ColorConverter() final  Color actionSecondary;
/// Card color
@override@ColorConverter() final  Color cardColor;
/// Divider color
@override@ColorConverter() final  Color divider;
/// Overlay color - for scrim and modal backdrop
@override@ColorConverter() final  Color overlay;
/// Focus color - for focus rings and accessibility
@override@ColorConverter() final  Color focus;
/// Success color - for positive actions and states
@override@ColorConverter() final  Color success;
/// Warning color - for caution states
@override@ColorConverter() final  Color warning;
/// Error color - for error states
@override@ColorConverter() final  Color error;
/// Info color - for informational states
@override@ColorConverter() final  Color info;
/// Disabled color - for disabled states
@override@ColorConverter() final  Color disabled;
/// White color
@override@ColorConverter() final  Color white;
/// Black color
@override@ColorConverter() final  Color black;
/// Primary gradient - from primary to secondary
@override@LinearGradientConverter() final  LinearGradient primaryGradient;
/// Secondary gradient - from secondary to accent
@override@LinearGradientConverter() final  LinearGradient secondaryGradient;

/// Create a copy of NebuxColors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NebuxColorsCopyWith<_NebuxColors> get copyWith => __$NebuxColorsCopyWithImpl<_NebuxColors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NebuxColorsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NebuxColors&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.secondaryVariant, secondaryVariant) || other.secondaryVariant == secondaryVariant)&&(identical(other.background, background) || other.background == background)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.textPrimary, textPrimary) || other.textPrimary == textPrimary)&&(identical(other.textSecondary, textSecondary) || other.textSecondary == textSecondary)&&(identical(other.actionPrimary, actionPrimary) || other.actionPrimary == actionPrimary)&&(identical(other.actionSecondary, actionSecondary) || other.actionSecondary == actionSecondary)&&(identical(other.cardColor, cardColor) || other.cardColor == cardColor)&&(identical(other.divider, divider) || other.divider == divider)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.focus, focus) || other.focus == focus)&&(identical(other.success, success) || other.success == success)&&(identical(other.warning, warning) || other.warning == warning)&&(identical(other.error, error) || other.error == error)&&(identical(other.info, info) || other.info == info)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.white, white) || other.white == white)&&(identical(other.black, black) || other.black == black)&&(identical(other.primaryGradient, primaryGradient) || other.primaryGradient == primaryGradient)&&(identical(other.secondaryGradient, secondaryGradient) || other.secondaryGradient == secondaryGradient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,secondary,secondaryVariant,background,surface,textPrimary,textSecondary,actionPrimary,actionSecondary,cardColor,divider,overlay,focus,success,warning,error,info,disabled,white,black,primaryGradient,secondaryGradient]);

@override
String toString() {
  return 'NebuxColors(primary: $primary, secondary: $secondary, secondaryVariant: $secondaryVariant, background: $background, surface: $surface, textPrimary: $textPrimary, textSecondary: $textSecondary, actionPrimary: $actionPrimary, actionSecondary: $actionSecondary, cardColor: $cardColor, divider: $divider, overlay: $overlay, focus: $focus, success: $success, warning: $warning, error: $error, info: $info, disabled: $disabled, white: $white, black: $black, primaryGradient: $primaryGradient, secondaryGradient: $secondaryGradient)';
}


}

/// @nodoc
abstract mixin class _$NebuxColorsCopyWith<$Res> implements $NebuxColorsCopyWith<$Res> {
  factory _$NebuxColorsCopyWith(_NebuxColors value, $Res Function(_NebuxColors) _then) = __$NebuxColorsCopyWithImpl;
@override @useResult
$Res call({
@ColorConverter() Color primary,@ColorConverter() Color secondary,@ColorConverter() Color secondaryVariant,@ColorConverter() Color background,@ColorConverter() Color surface,@ColorConverter() Color textPrimary,@ColorConverter() Color textSecondary,@ColorConverter() Color actionPrimary,@ColorConverter() Color actionSecondary,@ColorConverter() Color cardColor,@ColorConverter() Color divider,@ColorConverter() Color overlay,@ColorConverter() Color focus,@ColorConverter() Color success,@ColorConverter() Color warning,@ColorConverter() Color error,@ColorConverter() Color info,@ColorConverter() Color disabled,@ColorConverter() Color white,@ColorConverter() Color black,@LinearGradientConverter() LinearGradient primaryGradient,@LinearGradientConverter() LinearGradient secondaryGradient
});




}
/// @nodoc
class __$NebuxColorsCopyWithImpl<$Res>
    implements _$NebuxColorsCopyWith<$Res> {
  __$NebuxColorsCopyWithImpl(this._self, this._then);

  final _NebuxColors _self;
  final $Res Function(_NebuxColors) _then;

/// Create a copy of NebuxColors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? secondary = null,Object? secondaryVariant = null,Object? background = null,Object? surface = null,Object? textPrimary = null,Object? textSecondary = null,Object? actionPrimary = null,Object? actionSecondary = null,Object? cardColor = null,Object? divider = null,Object? overlay = null,Object? focus = null,Object? success = null,Object? warning = null,Object? error = null,Object? info = null,Object? disabled = null,Object? white = null,Object? black = null,Object? primaryGradient = null,Object? secondaryGradient = null,}) {
  return _then(_NebuxColors(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,secondaryVariant: null == secondaryVariant ? _self.secondaryVariant : secondaryVariant // ignore: cast_nullable_to_non_nullable
as Color,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color,textPrimary: null == textPrimary ? _self.textPrimary : textPrimary // ignore: cast_nullable_to_non_nullable
as Color,textSecondary: null == textSecondary ? _self.textSecondary : textSecondary // ignore: cast_nullable_to_non_nullable
as Color,actionPrimary: null == actionPrimary ? _self.actionPrimary : actionPrimary // ignore: cast_nullable_to_non_nullable
as Color,actionSecondary: null == actionSecondary ? _self.actionSecondary : actionSecondary // ignore: cast_nullable_to_non_nullable
as Color,cardColor: null == cardColor ? _self.cardColor : cardColor // ignore: cast_nullable_to_non_nullable
as Color,divider: null == divider ? _self.divider : divider // ignore: cast_nullable_to_non_nullable
as Color,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as Color,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as Color,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as Color,warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as Color,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Color,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as Color,white: null == white ? _self.white : white // ignore: cast_nullable_to_non_nullable
as Color,black: null == black ? _self.black : black // ignore: cast_nullable_to_non_nullable
as Color,primaryGradient: null == primaryGradient ? _self.primaryGradient : primaryGradient // ignore: cast_nullable_to_non_nullable
as LinearGradient,secondaryGradient: null == secondaryGradient ? _self.secondaryGradient : secondaryGradient // ignore: cast_nullable_to_non_nullable
as LinearGradient,
  ));
}


}


/// @nodoc
mixin _$NebuxColorThemes {

 NebuxColors get light; NebuxColors get dark;
/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NebuxColorThemesCopyWith<NebuxColorThemes> get copyWith => _$NebuxColorThemesCopyWithImpl<NebuxColorThemes>(this as NebuxColorThemes, _$identity);

  /// Serializes this NebuxColorThemes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NebuxColorThemes&&(identical(other.light, light) || other.light == light)&&(identical(other.dark, dark) || other.dark == dark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,light,dark);

@override
String toString() {
  return 'NebuxColorThemes(light: $light, dark: $dark)';
}


}

/// @nodoc
abstract mixin class $NebuxColorThemesCopyWith<$Res>  {
  factory $NebuxColorThemesCopyWith(NebuxColorThemes value, $Res Function(NebuxColorThemes) _then) = _$NebuxColorThemesCopyWithImpl;
@useResult
$Res call({
 NebuxColors light, NebuxColors dark
});


$NebuxColorsCopyWith<$Res> get light;$NebuxColorsCopyWith<$Res> get dark;

}
/// @nodoc
class _$NebuxColorThemesCopyWithImpl<$Res>
    implements $NebuxColorThemesCopyWith<$Res> {
  _$NebuxColorThemesCopyWithImpl(this._self, this._then);

  final NebuxColorThemes _self;
  final $Res Function(NebuxColorThemes) _then;

/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? light = null,Object? dark = null,}) {
  return _then(_self.copyWith(
light: null == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as NebuxColors,dark: null == dark ? _self.dark : dark // ignore: cast_nullable_to_non_nullable
as NebuxColors,
  ));
}
/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NebuxColorsCopyWith<$Res> get light {
  
  return $NebuxColorsCopyWith<$Res>(_self.light, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NebuxColorsCopyWith<$Res> get dark {
  
  return $NebuxColorsCopyWith<$Res>(_self.dark, (value) {
    return _then(_self.copyWith(dark: value));
  });
}
}


/// Adds pattern-matching-related methods to [NebuxColorThemes].
extension NebuxColorThemesPatterns on NebuxColorThemes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NebuxColorThemes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NebuxColorThemes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NebuxColorThemes value)  $default,){
final _that = this;
switch (_that) {
case _NebuxColorThemes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NebuxColorThemes value)?  $default,){
final _that = this;
switch (_that) {
case _NebuxColorThemes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NebuxColors light,  NebuxColors dark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NebuxColorThemes() when $default != null:
return $default(_that.light,_that.dark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NebuxColors light,  NebuxColors dark)  $default,) {final _that = this;
switch (_that) {
case _NebuxColorThemes():
return $default(_that.light,_that.dark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NebuxColors light,  NebuxColors dark)?  $default,) {final _that = this;
switch (_that) {
case _NebuxColorThemes() when $default != null:
return $default(_that.light,_that.dark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NebuxColorThemes extends NebuxColorThemes {
  const _NebuxColorThemes({required this.light, required this.dark}): super._();
  factory _NebuxColorThemes.fromJson(Map<String, dynamic> json) => _$NebuxColorThemesFromJson(json);

@override final  NebuxColors light;
@override final  NebuxColors dark;

/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NebuxColorThemesCopyWith<_NebuxColorThemes> get copyWith => __$NebuxColorThemesCopyWithImpl<_NebuxColorThemes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NebuxColorThemesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NebuxColorThemes&&(identical(other.light, light) || other.light == light)&&(identical(other.dark, dark) || other.dark == dark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,light,dark);

@override
String toString() {
  return 'NebuxColorThemes(light: $light, dark: $dark)';
}


}

/// @nodoc
abstract mixin class _$NebuxColorThemesCopyWith<$Res> implements $NebuxColorThemesCopyWith<$Res> {
  factory _$NebuxColorThemesCopyWith(_NebuxColorThemes value, $Res Function(_NebuxColorThemes) _then) = __$NebuxColorThemesCopyWithImpl;
@override @useResult
$Res call({
 NebuxColors light, NebuxColors dark
});


@override $NebuxColorsCopyWith<$Res> get light;@override $NebuxColorsCopyWith<$Res> get dark;

}
/// @nodoc
class __$NebuxColorThemesCopyWithImpl<$Res>
    implements _$NebuxColorThemesCopyWith<$Res> {
  __$NebuxColorThemesCopyWithImpl(this._self, this._then);

  final _NebuxColorThemes _self;
  final $Res Function(_NebuxColorThemes) _then;

/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? light = null,Object? dark = null,}) {
  return _then(_NebuxColorThemes(
light: null == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as NebuxColors,dark: null == dark ? _self.dark : dark // ignore: cast_nullable_to_non_nullable
as NebuxColors,
  ));
}

/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NebuxColorsCopyWith<$Res> get light {
  
  return $NebuxColorsCopyWith<$Res>(_self.light, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of NebuxColorThemes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NebuxColorsCopyWith<$Res> get dark {
  
  return $NebuxColorsCopyWith<$Res>(_self.dark, (value) {
    return _then(_self.copyWith(dark: value));
  });
}
}

// dart format on
