import 'package:flutter/material.dart';

/// Configuration class for button icons and their styling.
///
/// This class encapsulates all icon-related properties for the [NbxButton] widget,
/// including leading and trailing icons with their respective colors.
class ButtonIconConfig {
  /// Icon to display before the text.
  final IconData? icon;

  /// The color of the leading icon.
  final Color? iconColor;

  /// Icon to display after the text.
  final IconData? trailingIcon;

  /// The color of the trailing icon.
  final Color? trailingIconColor;

  /// Creates a [ButtonIconConfig] with the specified icon properties.
  ///
  /// @param icon: Icon to display before the text [IconData?]
  /// @param iconColor: The color of the leading icon [Color?]
  /// @param trailingIcon: Icon to display after the text [IconData?]
  /// @param trailingIconColor: The color of the trailing icon [Color?]
  const ButtonIconConfig({
    this.icon,
    this.iconColor,
    this.trailingIcon,
    this.trailingIconColor,
  });

  /// Creates a copy of this [ButtonIconConfig] with the given fields replaced with new values.
  ///
  /// @param icon: Icon to display before the text [IconData?]
  /// @param iconColor: The color of the leading icon [Color?]
  /// @param trailingIcon: Icon to display after the text [IconData?]
  /// @param trailingIconColor: The color of the trailing icon [Color?]
  /// @returns: A new [ButtonIconConfig] instance with updated values [ButtonIconConfig]
  ButtonIconConfig copyWith({
    IconData? icon,
    Color? iconColor,
    IconData? trailingIcon,
    Color? trailingIconColor,
  }) {
    return ButtonIconConfig(
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      trailingIconColor: trailingIconColor ?? this.trailingIconColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonIconConfig &&
        other.icon == icon &&
        other.iconColor == iconColor &&
        other.trailingIcon == trailingIcon &&
        other.trailingIconColor == trailingIconColor;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        iconColor.hashCode ^
        trailingIcon.hashCode ^
        trailingIconColor.hashCode;
  }
}
