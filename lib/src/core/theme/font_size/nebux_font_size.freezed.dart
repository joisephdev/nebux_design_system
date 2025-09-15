// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nebux_font_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NebuxFontSize {

/// Extra small font size (8px)
 double get extraSmall;/// Small font size (10px)
 double get small;/// Medium font size (12px)
 double get medium;/// Medium large font size (13px)
 double get mediumLarge;/// Large font size (14px)
 double get large;/// Extra large font size (16px)
 double get extraLarge;/// Heading 4 font size (18px)
 double get heading4;/// Heading 3 font size (20px)
 double get heading3;/// Heading 2 font size (22px)
 double get heading2;/// Heading 1 font size (24px)
 double get heading1;/// Display 3 font size (28px)
 double get display3;/// Display 2 font size (32px)
 double get display2;/// Display 1 font size (36px)
 double get display1;
/// Create a copy of NebuxFontSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NebuxFontSizeCopyWith<NebuxFontSize> get copyWith => _$NebuxFontSizeCopyWithImpl<NebuxFontSize>(this as NebuxFontSize, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NebuxFontSize&&(identical(other.extraSmall, extraSmall) || other.extraSmall == extraSmall)&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.mediumLarge, mediumLarge) || other.mediumLarge == mediumLarge)&&(identical(other.large, large) || other.large == large)&&(identical(other.extraLarge, extraLarge) || other.extraLarge == extraLarge)&&(identical(other.heading4, heading4) || other.heading4 == heading4)&&(identical(other.heading3, heading3) || other.heading3 == heading3)&&(identical(other.heading2, heading2) || other.heading2 == heading2)&&(identical(other.heading1, heading1) || other.heading1 == heading1)&&(identical(other.display3, display3) || other.display3 == display3)&&(identical(other.display2, display2) || other.display2 == display2)&&(identical(other.display1, display1) || other.display1 == display1));
}


@override
int get hashCode => Object.hash(runtimeType,extraSmall,small,medium,mediumLarge,large,extraLarge,heading4,heading3,heading2,heading1,display3,display2,display1);

@override
String toString() {
  return 'NebuxFontSize(extraSmall: $extraSmall, small: $small, medium: $medium, mediumLarge: $mediumLarge, large: $large, extraLarge: $extraLarge, heading4: $heading4, heading3: $heading3, heading2: $heading2, heading1: $heading1, display3: $display3, display2: $display2, display1: $display1)';
}


}

/// @nodoc
abstract mixin class $NebuxFontSizeCopyWith<$Res>  {
  factory $NebuxFontSizeCopyWith(NebuxFontSize value, $Res Function(NebuxFontSize) _then) = _$NebuxFontSizeCopyWithImpl;
@useResult
$Res call({
 double extraSmall, double small, double medium, double mediumLarge, double large, double extraLarge, double heading4, double heading3, double heading2, double heading1, double display3, double display2, double display1
});




}
/// @nodoc
class _$NebuxFontSizeCopyWithImpl<$Res>
    implements $NebuxFontSizeCopyWith<$Res> {
  _$NebuxFontSizeCopyWithImpl(this._self, this._then);

  final NebuxFontSize _self;
  final $Res Function(NebuxFontSize) _then;

/// Create a copy of NebuxFontSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? extraSmall = null,Object? small = null,Object? medium = null,Object? mediumLarge = null,Object? large = null,Object? extraLarge = null,Object? heading4 = null,Object? heading3 = null,Object? heading2 = null,Object? heading1 = null,Object? display3 = null,Object? display2 = null,Object? display1 = null,}) {
  return _then(_self.copyWith(
extraSmall: null == extraSmall ? _self.extraSmall : extraSmall // ignore: cast_nullable_to_non_nullable
as double,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as double,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as double,mediumLarge: null == mediumLarge ? _self.mediumLarge : mediumLarge // ignore: cast_nullable_to_non_nullable
as double,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as double,extraLarge: null == extraLarge ? _self.extraLarge : extraLarge // ignore: cast_nullable_to_non_nullable
as double,heading4: null == heading4 ? _self.heading4 : heading4 // ignore: cast_nullable_to_non_nullable
as double,heading3: null == heading3 ? _self.heading3 : heading3 // ignore: cast_nullable_to_non_nullable
as double,heading2: null == heading2 ? _self.heading2 : heading2 // ignore: cast_nullable_to_non_nullable
as double,heading1: null == heading1 ? _self.heading1 : heading1 // ignore: cast_nullable_to_non_nullable
as double,display3: null == display3 ? _self.display3 : display3 // ignore: cast_nullable_to_non_nullable
as double,display2: null == display2 ? _self.display2 : display2 // ignore: cast_nullable_to_non_nullable
as double,display1: null == display1 ? _self.display1 : display1 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NebuxFontSize].
extension NebuxFontSizePatterns on NebuxFontSize {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NebuxFontSize value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NebuxFontSize() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NebuxFontSize value)  $default,){
final _that = this;
switch (_that) {
case _NebuxFontSize():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NebuxFontSize value)?  $default,){
final _that = this;
switch (_that) {
case _NebuxFontSize() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double extraSmall,  double small,  double medium,  double mediumLarge,  double large,  double extraLarge,  double heading4,  double heading3,  double heading2,  double heading1,  double display3,  double display2,  double display1)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NebuxFontSize() when $default != null:
return $default(_that.extraSmall,_that.small,_that.medium,_that.mediumLarge,_that.large,_that.extraLarge,_that.heading4,_that.heading3,_that.heading2,_that.heading1,_that.display3,_that.display2,_that.display1);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double extraSmall,  double small,  double medium,  double mediumLarge,  double large,  double extraLarge,  double heading4,  double heading3,  double heading2,  double heading1,  double display3,  double display2,  double display1)  $default,) {final _that = this;
switch (_that) {
case _NebuxFontSize():
return $default(_that.extraSmall,_that.small,_that.medium,_that.mediumLarge,_that.large,_that.extraLarge,_that.heading4,_that.heading3,_that.heading2,_that.heading1,_that.display3,_that.display2,_that.display1);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double extraSmall,  double small,  double medium,  double mediumLarge,  double large,  double extraLarge,  double heading4,  double heading3,  double heading2,  double heading1,  double display3,  double display2,  double display1)?  $default,) {final _that = this;
switch (_that) {
case _NebuxFontSize() when $default != null:
return $default(_that.extraSmall,_that.small,_that.medium,_that.mediumLarge,_that.large,_that.extraLarge,_that.heading4,_that.heading3,_that.heading2,_that.heading1,_that.display3,_that.display2,_that.display1);case _:
  return null;

}
}

}

/// @nodoc


class _NebuxFontSize extends NebuxFontSize {
  const _NebuxFontSize({required this.extraSmall, required this.small, required this.medium, required this.mediumLarge, required this.large, required this.extraLarge, required this.heading4, required this.heading3, required this.heading2, required this.heading1, required this.display3, required this.display2, required this.display1}): super._();
  

/// Extra small font size (8px)
@override final  double extraSmall;
/// Small font size (10px)
@override final  double small;
/// Medium font size (12px)
@override final  double medium;
/// Medium large font size (13px)
@override final  double mediumLarge;
/// Large font size (14px)
@override final  double large;
/// Extra large font size (16px)
@override final  double extraLarge;
/// Heading 4 font size (18px)
@override final  double heading4;
/// Heading 3 font size (20px)
@override final  double heading3;
/// Heading 2 font size (22px)
@override final  double heading2;
/// Heading 1 font size (24px)
@override final  double heading1;
/// Display 3 font size (28px)
@override final  double display3;
/// Display 2 font size (32px)
@override final  double display2;
/// Display 1 font size (36px)
@override final  double display1;

/// Create a copy of NebuxFontSize
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NebuxFontSizeCopyWith<_NebuxFontSize> get copyWith => __$NebuxFontSizeCopyWithImpl<_NebuxFontSize>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NebuxFontSize&&(identical(other.extraSmall, extraSmall) || other.extraSmall == extraSmall)&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.mediumLarge, mediumLarge) || other.mediumLarge == mediumLarge)&&(identical(other.large, large) || other.large == large)&&(identical(other.extraLarge, extraLarge) || other.extraLarge == extraLarge)&&(identical(other.heading4, heading4) || other.heading4 == heading4)&&(identical(other.heading3, heading3) || other.heading3 == heading3)&&(identical(other.heading2, heading2) || other.heading2 == heading2)&&(identical(other.heading1, heading1) || other.heading1 == heading1)&&(identical(other.display3, display3) || other.display3 == display3)&&(identical(other.display2, display2) || other.display2 == display2)&&(identical(other.display1, display1) || other.display1 == display1));
}


@override
int get hashCode => Object.hash(runtimeType,extraSmall,small,medium,mediumLarge,large,extraLarge,heading4,heading3,heading2,heading1,display3,display2,display1);

@override
String toString() {
  return 'NebuxFontSize(extraSmall: $extraSmall, small: $small, medium: $medium, mediumLarge: $mediumLarge, large: $large, extraLarge: $extraLarge, heading4: $heading4, heading3: $heading3, heading2: $heading2, heading1: $heading1, display3: $display3, display2: $display2, display1: $display1)';
}


}

/// @nodoc
abstract mixin class _$NebuxFontSizeCopyWith<$Res> implements $NebuxFontSizeCopyWith<$Res> {
  factory _$NebuxFontSizeCopyWith(_NebuxFontSize value, $Res Function(_NebuxFontSize) _then) = __$NebuxFontSizeCopyWithImpl;
@override @useResult
$Res call({
 double extraSmall, double small, double medium, double mediumLarge, double large, double extraLarge, double heading4, double heading3, double heading2, double heading1, double display3, double display2, double display1
});




}
/// @nodoc
class __$NebuxFontSizeCopyWithImpl<$Res>
    implements _$NebuxFontSizeCopyWith<$Res> {
  __$NebuxFontSizeCopyWithImpl(this._self, this._then);

  final _NebuxFontSize _self;
  final $Res Function(_NebuxFontSize) _then;

/// Create a copy of NebuxFontSize
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? extraSmall = null,Object? small = null,Object? medium = null,Object? mediumLarge = null,Object? large = null,Object? extraLarge = null,Object? heading4 = null,Object? heading3 = null,Object? heading2 = null,Object? heading1 = null,Object? display3 = null,Object? display2 = null,Object? display1 = null,}) {
  return _then(_NebuxFontSize(
extraSmall: null == extraSmall ? _self.extraSmall : extraSmall // ignore: cast_nullable_to_non_nullable
as double,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as double,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as double,mediumLarge: null == mediumLarge ? _self.mediumLarge : mediumLarge // ignore: cast_nullable_to_non_nullable
as double,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as double,extraLarge: null == extraLarge ? _self.extraLarge : extraLarge // ignore: cast_nullable_to_non_nullable
as double,heading4: null == heading4 ? _self.heading4 : heading4 // ignore: cast_nullable_to_non_nullable
as double,heading3: null == heading3 ? _self.heading3 : heading3 // ignore: cast_nullable_to_non_nullable
as double,heading2: null == heading2 ? _self.heading2 : heading2 // ignore: cast_nullable_to_non_nullable
as double,heading1: null == heading1 ? _self.heading1 : heading1 // ignore: cast_nullable_to_non_nullable
as double,display3: null == display3 ? _self.display3 : display3 // ignore: cast_nullable_to_non_nullable
as double,display2: null == display2 ? _self.display2 : display2 // ignore: cast_nullable_to_non_nullable
as double,display1: null == display1 ? _self.display1 : display1 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
