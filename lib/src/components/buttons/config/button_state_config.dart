import 'dart:ui';

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

  /// Custom color for the loading spinner.
  /// When null, the spinner color is derived from the button variant.
  final Color? loadingColor;

  /// Creates a [ButtonStateConfig] with the specified state properties.
  const ButtonStateConfig({
    this.isLoading = false,
    this.enabled = true,
    this.isSelected = false,
    this.loadingColor,
  });

  /// Creates a copy of this [ButtonStateConfig] with the given fields replaced with new values.
  ButtonStateConfig copyWith({
    bool? isLoading,
    bool? enabled,
    bool? isSelected,
    Color? loadingColor,
  }) {
    return ButtonStateConfig(
      isLoading: isLoading ?? this.isLoading,
      enabled: enabled ?? this.enabled,
      isSelected: isSelected ?? this.isSelected,
      loadingColor: loadingColor ?? this.loadingColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonStateConfig &&
        other.isLoading == isLoading &&
        other.enabled == enabled &&
        other.isSelected == isSelected &&
        other.loadingColor == loadingColor;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        enabled.hashCode ^
        isSelected.hashCode ^
        loadingColor.hashCode;
  }
}
