import 'package:flutter/material.dart';
import '../widgets/nbx_button_widget.dart';

/// Configuration class for button visual styling and appearance.
///
/// This class encapsulates all style-related properties for the [NbxButton] widget,
/// including variant, colors, border radius, and text styling.
class ButtonStyleConfig {
  /// The visual variant of the button.
  final ButtonVariant variant;

  /// Custom background color for the button.
  final Color? customBackgroundColor;

  /// Custom background color when the button is disabled.
  ///
  /// When null, falls back to the theme disabled token for each variant.
  final Color? customDisabledBackgroundColor;

  /// Custom foreground color when the button is disabled.
  ///
  /// Applies to label, icons, and Material button foreground when disabled.
  /// When null, falls back to variant-specific theme tokens.
  final Color? customDisabledForegroundColor;

  /// Custom border radius for the button.
  final double? borderRadius;

  /// Custom text style for the button.
  final TextStyle? textStyle;

  final BorderSide? customBorderSide;

  /// Creates a [ButtonStyleConfig] with the specified style properties.
  ///
  /// @param variant: The visual variant of the button [ButtonVariant]
  /// @param customBackgroundColor: Custom background color for the button [Color?]
  /// @param customDisabledBackgroundColor: Disabled background color [Color?]
  /// @param customDisabledForegroundColor: Disabled foreground color [Color?]
  /// @param borderRadius: Custom border radius for the button [double?]
  /// @param textStyle: Custom text style for the button [TextStyle?]
  const ButtonStyleConfig({
    this.variant = ButtonVariant.filled,
    this.customBackgroundColor,
    this.customDisabledBackgroundColor,
    this.customDisabledForegroundColor,
    this.borderRadius,
    this.textStyle,
    this.customBorderSide,
  });

  /// Creates a copy of this [ButtonStyleConfig] with the given fields replaced with new values.
  ///
  /// @param variant: The visual variant of the button [ButtonVariant]
  /// @param customBackgroundColor: Custom background color for the button [Color?]
  /// @param customDisabledBackgroundColor: Disabled background color [Color?]
  /// @param customDisabledForegroundColor: Disabled foreground color [Color?]
  /// @param borderRadius: Custom border radius for the button [double?]
  /// @param textStyle: Custom text style for the button [TextStyle?]
  /// @returns: A new [ButtonStyleConfig] instance with updated values [ButtonStyleConfig]
  ButtonStyleConfig copyWith({
    ButtonVariant? variant,
    Color? customBackgroundColor,
    Color? customDisabledBackgroundColor,
    Color? customDisabledForegroundColor,
    double? borderRadius,
    TextStyle? textStyle,
    BorderSide? customBorderSide,
  }) {
    return ButtonStyleConfig(
      variant: variant ?? this.variant,
      customBackgroundColor:
          customBackgroundColor ?? this.customBackgroundColor,
      customDisabledBackgroundColor:
          customDisabledBackgroundColor ?? this.customDisabledBackgroundColor,
      customDisabledForegroundColor:
          customDisabledForegroundColor ?? this.customDisabledForegroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      customBorderSide: customBorderSide ?? this.customBorderSide,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonStyleConfig &&
        other.variant == variant &&
        other.customBackgroundColor == customBackgroundColor &&
        other.customDisabledBackgroundColor == customDisabledBackgroundColor &&
        other.customDisabledForegroundColor == customDisabledForegroundColor &&
        other.borderRadius == borderRadius &&
        other.textStyle == textStyle &&
        other.customBorderSide == customBorderSide;
  }

  @override
  int get hashCode {
    return variant.hashCode ^
        customBackgroundColor.hashCode ^
        customDisabledBackgroundColor.hashCode ^
        customDisabledForegroundColor.hashCode ^
        borderRadius.hashCode ^
        textStyle.hashCode ^
        customBorderSide.hashCode;
  }
}
