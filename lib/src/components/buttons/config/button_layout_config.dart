/// Configuration class for button layout properties.
///
/// This class encapsulates all layout-related properties for the [NbxButton] widget,
/// including expansion behavior and sizing.
class ButtonLayoutConfig {
  /// Whether the button should expand to fill available width.
  final bool isExpanded;

  /// Creates a [ButtonLayoutConfig] with the specified layout properties.
  ///
  /// @param isExpanded: Whether the button should expand to fill available width [bool]
  const ButtonLayoutConfig({this.isExpanded = true});

  /// Creates a copy of this [ButtonLayoutConfig] with the given fields replaced with new values.
  ///
  /// @param isExpanded: Whether the button should expand to fill available width [bool]
  /// @returns: A new [ButtonLayoutConfig] instance with updated values [ButtonLayoutConfig]
  ButtonLayoutConfig copyWith({bool? isExpanded}) {
    return ButtonLayoutConfig(isExpanded: isExpanded ?? this.isExpanded);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonLayoutConfig && other.isExpanded == isExpanded;
  }

  @override
  int get hashCode => isExpanded.hashCode;
}
