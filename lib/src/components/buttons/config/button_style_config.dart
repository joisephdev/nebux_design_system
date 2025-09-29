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

  /// Custom border radius for the button.
  final double? borderRadius;

  /// Custom text style for the button.
  final TextStyle? textStyle;

  /// Creates a [ButtonStyleConfig] with the specified style properties.
  ///
  /// @param variant: The visual variant of the button [ButtonVariant]
  /// @param customBackgroundColor: Custom background color for the button [Color?]
  /// @param borderRadius: Custom border radius for the button [double?]
  /// @param textStyle: Custom text style for the button [TextStyle?]
  const ButtonStyleConfig({
    this.variant = ButtonVariant.filled,
    this.customBackgroundColor,
    this.borderRadius,
    this.textStyle,
  });

  /// Creates a copy of this [ButtonStyleConfig] with the given fields replaced with new values.
  ///
  /// @param variant: The visual variant of the button [ButtonVariant]
  /// @param customBackgroundColor: Custom background color for the button [Color?]
  /// @param borderRadius: Custom border radius for the button [double?]
  /// @param textStyle: Custom text style for the button [TextStyle?]
  /// @returns: A new [ButtonStyleConfig] instance with updated values [ButtonStyleConfig]
  ButtonStyleConfig copyWith({
    ButtonVariant? variant,
    Color? customBackgroundColor,
    double? borderRadius,
    TextStyle? textStyle,
  }) {
    return ButtonStyleConfig(
      variant: variant ?? this.variant,
      customBackgroundColor:
          customBackgroundColor ?? this.customBackgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonStyleConfig &&
        other.variant == variant &&
        other.customBackgroundColor == customBackgroundColor &&
        other.borderRadius == borderRadius &&
        other.textStyle == textStyle;
  }

  @override
  int get hashCode {
    return variant.hashCode ^
        customBackgroundColor.hashCode ^
        borderRadius.hashCode ^
        textStyle.hashCode;
  }
}
