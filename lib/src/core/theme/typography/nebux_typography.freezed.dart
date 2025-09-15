// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nebux_typography.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NebuxTypography {

/// Style for main content text (e.g., articles, descriptions).
/// Font size: 16px and font weight: 400
 TextStyle get content;/// Style for regular paragraph text (e.g., default content, paragraphs).
/// Font size: 14px and font weight: 400
 TextStyle get paragraph;/// Style for small supporting text (e.g., captions, metadata).
/// Font size: 12px and font weight: 400
 TextStyle get caption;/// Style for main headings (e.g., page titles, primary headers).
/// Font size: 24px and font weight: 600
 TextStyle get heading;/// Style for section headers (e.g., content sections)
/// Font size: 22px and font weight: 500
 TextStyle get section;/// Style for small labels (e.g., timestamps, status).
/// Font size: 10px and font weight: 500
 TextStyle get label;/// Style for primary action buttons.
/// Font size: 14px and font weight: 700
 TextStyle get primaryAction;/// Style for secondary action buttons.
/// Font size: 14px and font weight: 600
 TextStyle get secondaryAction;/// Style for form input text fields.
/// Font size: 14px and font weight: 400
 TextStyle get formInput;/// Style for placeholder text in inputs.
/// Font size: 14px and font weight: 400 and font style: italic
 TextStyle get placeholder;
/// Create a copy of NebuxTypography
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NebuxTypographyCopyWith<NebuxTypography> get copyWith => _$NebuxTypographyCopyWithImpl<NebuxTypography>(this as NebuxTypography, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NebuxTypography&&(identical(other.content, content) || other.content == content)&&(identical(other.paragraph, paragraph) || other.paragraph == paragraph)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.section, section) || other.section == section)&&(identical(other.label, label) || other.label == label)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction)&&(identical(other.formInput, formInput) || other.formInput == formInput)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder));
}


@override
int get hashCode => Object.hash(runtimeType,content,paragraph,caption,heading,section,label,primaryAction,secondaryAction,formInput,placeholder);

@override
String toString() {
  return 'NebuxTypography(content: $content, paragraph: $paragraph, caption: $caption, heading: $heading, section: $section, label: $label, primaryAction: $primaryAction, secondaryAction: $secondaryAction, formInput: $formInput, placeholder: $placeholder)';
}


}

/// @nodoc
abstract mixin class $NebuxTypographyCopyWith<$Res>  {
  factory $NebuxTypographyCopyWith(NebuxTypography value, $Res Function(NebuxTypography) _then) = _$NebuxTypographyCopyWithImpl;
@useResult
$Res call({
 TextStyle content, TextStyle paragraph, TextStyle caption, TextStyle heading, TextStyle section, TextStyle label, TextStyle primaryAction, TextStyle secondaryAction, TextStyle formInput, TextStyle placeholder
});




}
/// @nodoc
class _$NebuxTypographyCopyWithImpl<$Res>
    implements $NebuxTypographyCopyWith<$Res> {
  _$NebuxTypographyCopyWithImpl(this._self, this._then);

  final NebuxTypography _self;
  final $Res Function(NebuxTypography) _then;

/// Create a copy of NebuxTypography
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? paragraph = null,Object? caption = null,Object? heading = null,Object? section = null,Object? label = null,Object? primaryAction = null,Object? secondaryAction = null,Object? formInput = null,Object? placeholder = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TextStyle,paragraph: null == paragraph ? _self.paragraph : paragraph // ignore: cast_nullable_to_non_nullable
as TextStyle,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as TextStyle,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as TextStyle,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as TextStyle,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as TextStyle,primaryAction: null == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as TextStyle,secondaryAction: null == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as TextStyle,formInput: null == formInput ? _self.formInput : formInput // ignore: cast_nullable_to_non_nullable
as TextStyle,placeholder: null == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as TextStyle,
  ));
}

}


/// Adds pattern-matching-related methods to [NebuxTypography].
extension NebuxTypographyPatterns on NebuxTypography {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NebuxTypography value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NebuxTypography() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NebuxTypography value)  $default,){
final _that = this;
switch (_that) {
case _NebuxTypography():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NebuxTypography value)?  $default,){
final _that = this;
switch (_that) {
case _NebuxTypography() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextStyle content,  TextStyle paragraph,  TextStyle caption,  TextStyle heading,  TextStyle section,  TextStyle label,  TextStyle primaryAction,  TextStyle secondaryAction,  TextStyle formInput,  TextStyle placeholder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NebuxTypography() when $default != null:
return $default(_that.content,_that.paragraph,_that.caption,_that.heading,_that.section,_that.label,_that.primaryAction,_that.secondaryAction,_that.formInput,_that.placeholder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextStyle content,  TextStyle paragraph,  TextStyle caption,  TextStyle heading,  TextStyle section,  TextStyle label,  TextStyle primaryAction,  TextStyle secondaryAction,  TextStyle formInput,  TextStyle placeholder)  $default,) {final _that = this;
switch (_that) {
case _NebuxTypography():
return $default(_that.content,_that.paragraph,_that.caption,_that.heading,_that.section,_that.label,_that.primaryAction,_that.secondaryAction,_that.formInput,_that.placeholder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextStyle content,  TextStyle paragraph,  TextStyle caption,  TextStyle heading,  TextStyle section,  TextStyle label,  TextStyle primaryAction,  TextStyle secondaryAction,  TextStyle formInput,  TextStyle placeholder)?  $default,) {final _that = this;
switch (_that) {
case _NebuxTypography() when $default != null:
return $default(_that.content,_that.paragraph,_that.caption,_that.heading,_that.section,_that.label,_that.primaryAction,_that.secondaryAction,_that.formInput,_that.placeholder);case _:
  return null;

}
}

}

/// @nodoc


class _NebuxTypography extends NebuxTypography {
  const _NebuxTypography({required this.content, required this.paragraph, required this.caption, required this.heading, required this.section, required this.label, required this.primaryAction, required this.secondaryAction, required this.formInput, required this.placeholder}): super._();
  

/// Style for main content text (e.g., articles, descriptions).
/// Font size: 16px and font weight: 400
@override final  TextStyle content;
/// Style for regular paragraph text (e.g., default content, paragraphs).
/// Font size: 14px and font weight: 400
@override final  TextStyle paragraph;
/// Style for small supporting text (e.g., captions, metadata).
/// Font size: 12px and font weight: 400
@override final  TextStyle caption;
/// Style for main headings (e.g., page titles, primary headers).
/// Font size: 24px and font weight: 600
@override final  TextStyle heading;
/// Style for section headers (e.g., content sections)
/// Font size: 22px and font weight: 500
@override final  TextStyle section;
/// Style for small labels (e.g., timestamps, status).
/// Font size: 10px and font weight: 500
@override final  TextStyle label;
/// Style for primary action buttons.
/// Font size: 14px and font weight: 700
@override final  TextStyle primaryAction;
/// Style for secondary action buttons.
/// Font size: 14px and font weight: 600
@override final  TextStyle secondaryAction;
/// Style for form input text fields.
/// Font size: 14px and font weight: 400
@override final  TextStyle formInput;
/// Style for placeholder text in inputs.
/// Font size: 14px and font weight: 400 and font style: italic
@override final  TextStyle placeholder;

/// Create a copy of NebuxTypography
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NebuxTypographyCopyWith<_NebuxTypography> get copyWith => __$NebuxTypographyCopyWithImpl<_NebuxTypography>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NebuxTypography&&(identical(other.content, content) || other.content == content)&&(identical(other.paragraph, paragraph) || other.paragraph == paragraph)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.section, section) || other.section == section)&&(identical(other.label, label) || other.label == label)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction)&&(identical(other.formInput, formInput) || other.formInput == formInput)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder));
}


@override
int get hashCode => Object.hash(runtimeType,content,paragraph,caption,heading,section,label,primaryAction,secondaryAction,formInput,placeholder);

@override
String toString() {
  return 'NebuxTypography(content: $content, paragraph: $paragraph, caption: $caption, heading: $heading, section: $section, label: $label, primaryAction: $primaryAction, secondaryAction: $secondaryAction, formInput: $formInput, placeholder: $placeholder)';
}


}

/// @nodoc
abstract mixin class _$NebuxTypographyCopyWith<$Res> implements $NebuxTypographyCopyWith<$Res> {
  factory _$NebuxTypographyCopyWith(_NebuxTypography value, $Res Function(_NebuxTypography) _then) = __$NebuxTypographyCopyWithImpl;
@override @useResult
$Res call({
 TextStyle content, TextStyle paragraph, TextStyle caption, TextStyle heading, TextStyle section, TextStyle label, TextStyle primaryAction, TextStyle secondaryAction, TextStyle formInput, TextStyle placeholder
});




}
/// @nodoc
class __$NebuxTypographyCopyWithImpl<$Res>
    implements _$NebuxTypographyCopyWith<$Res> {
  __$NebuxTypographyCopyWithImpl(this._self, this._then);

  final _NebuxTypography _self;
  final $Res Function(_NebuxTypography) _then;

/// Create a copy of NebuxTypography
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? paragraph = null,Object? caption = null,Object? heading = null,Object? section = null,Object? label = null,Object? primaryAction = null,Object? secondaryAction = null,Object? formInput = null,Object? placeholder = null,}) {
  return _then(_NebuxTypography(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TextStyle,paragraph: null == paragraph ? _self.paragraph : paragraph // ignore: cast_nullable_to_non_nullable
as TextStyle,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as TextStyle,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as TextStyle,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as TextStyle,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as TextStyle,primaryAction: null == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as TextStyle,secondaryAction: null == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as TextStyle,formInput: null == formInput ? _self.formInput : formInput // ignore: cast_nullable_to_non_nullable
as TextStyle,placeholder: null == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as TextStyle,
  ));
}


}

// dart format on
