/// Configuration class for button state management.
///
/// This class encapsulates all state-related properties for the [NbxButton] widget,
/// including loading state, enabled state, and selection state.
class ButtonStateConfig {
  /// Whether to show a loading indicator instead of text.
  final bool isLoading;

  /// Whether the button is enabled.
  final bool enabled;

  /// Whether the button is selected.
  final bool isSelected;

  /// Creates a [ButtonStateConfig] with the specified state properties.
  ///
  /// @param isLoading: Whether to show a loading indicator instead of text [bool]
  /// @param enabled: Whether the button is enabled [bool]
  /// @param isSelected: Whether the button is selected [bool]
  const ButtonStateConfig({
    this.isLoading = false,
    this.enabled = true,
    this.isSelected = false,
  });

  /// Creates a copy of this [ButtonStateConfig] with the given fields replaced with new values.
  ///
  /// @param isLoading: Whether to show a loading indicator instead of text [bool]
  /// @param enabled: Whether the button is enabled [bool]
  /// @param isSelected: Whether the button is selected [bool]
  /// @returns: A new [ButtonStateConfig] instance with updated values [ButtonStateConfig]
  ButtonStateConfig copyWith({
    bool? isLoading,
    bool? enabled,
    bool? isSelected,
  }) {
    return ButtonStateConfig(
      isLoading: isLoading ?? this.isLoading,
      enabled: enabled ?? this.enabled,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonStateConfig &&
        other.isLoading == isLoading &&
        other.enabled == enabled &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^ enabled.hashCode ^ isSelected.hashCode;
  }
}
