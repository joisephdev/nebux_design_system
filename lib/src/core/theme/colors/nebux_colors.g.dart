// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nebux_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NebuxColors _$NebuxColorsFromJson(Map<String, dynamic> json) => _NebuxColors(
  primary: const ColorConverter().fromJson(json['primary']),
  secondary: const ColorConverter().fromJson(json['secondary']),
  secondaryVariant: const ColorConverter().fromJson(json['secondaryVariant']),
  background: const ColorConverter().fromJson(json['background']),
  surface: const ColorConverter().fromJson(json['surface']),
  textPrimary: const ColorConverter().fromJson(json['textPrimary']),
  textSecondary: const ColorConverter().fromJson(json['textSecondary']),
  actionPrimary: const ColorConverter().fromJson(json['actionPrimary']),
  actionSecondary: const ColorConverter().fromJson(json['actionSecondary']),
  cardColor: const ColorConverter().fromJson(json['cardColor']),
  divider: const ColorConverter().fromJson(json['divider']),
  overlay: const ColorConverter().fromJson(json['overlay']),
  focus: const ColorConverter().fromJson(json['focus']),
  success: const ColorConverter().fromJson(json['success']),
  warning: const ColorConverter().fromJson(json['warning']),
  error: const ColorConverter().fromJson(json['error']),
  info: const ColorConverter().fromJson(json['info']),
  disabled: const ColorConverter().fromJson(json['disabled']),
  white: const ColorConverter().fromJson(json['white']),
  black: const ColorConverter().fromJson(json['black']),
  primaryGradient: const LinearGradientConverter().fromJson(
    json['primaryGradient'] as Map<String, dynamic>,
  ),
  secondaryGradient: const LinearGradientConverter().fromJson(
    json['secondaryGradient'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$NebuxColorsToJson(
  _NebuxColors instance,
) => <String, dynamic>{
  'primary': const ColorConverter().toJson(instance.primary),
  'secondary': const ColorConverter().toJson(instance.secondary),
  'secondaryVariant': const ColorConverter().toJson(instance.secondaryVariant),
  'background': const ColorConverter().toJson(instance.background),
  'surface': const ColorConverter().toJson(instance.surface),
  'textPrimary': const ColorConverter().toJson(instance.textPrimary),
  'textSecondary': const ColorConverter().toJson(instance.textSecondary),
  'actionPrimary': const ColorConverter().toJson(instance.actionPrimary),
  'actionSecondary': const ColorConverter().toJson(instance.actionSecondary),
  'cardColor': const ColorConverter().toJson(instance.cardColor),
  'divider': const ColorConverter().toJson(instance.divider),
  'overlay': const ColorConverter().toJson(instance.overlay),
  'focus': const ColorConverter().toJson(instance.focus),
  'success': const ColorConverter().toJson(instance.success),
  'warning': const ColorConverter().toJson(instance.warning),
  'error': const ColorConverter().toJson(instance.error),
  'info': const ColorConverter().toJson(instance.info),
  'disabled': const ColorConverter().toJson(instance.disabled),
  'white': const ColorConverter().toJson(instance.white),
  'black': const ColorConverter().toJson(instance.black),
  'primaryGradient': const LinearGradientConverter().toJson(
    instance.primaryGradient,
  ),
  'secondaryGradient': const LinearGradientConverter().toJson(
    instance.secondaryGradient,
  ),
};

_NebuxColorThemes _$NebuxColorThemesFromJson(Map<String, dynamic> json) =>
    _NebuxColorThemes(
      light: NebuxColors.fromJson(json['light'] as Map<String, dynamic>),
      dark: NebuxColors.fromJson(json['dark'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NebuxColorThemesToJson(_NebuxColorThemes instance) =>
    <String, dynamic>{'light': instance.light, 'dark': instance.dark};
