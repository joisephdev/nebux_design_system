enum NbxInputType {
  text,
  free,
  onlyText,
  textAndNumbers,
  dropdownMenu,
  alphabet,
  number,
  phone,
  password,
  decimalNumber,
  email,
}

/// Defines the visual style or appearance of the input field, specifically how the label and hint are displayed.
///
/// - [floating]: Label appears inside the input field and floats above when focused.
/// - [outlined]: Label appears above the input field, outside the border.
/// - [filled]: Only hint text is shown inside the input field, no label.
///
/// This is not a "form type" nor an "input type", but rather an "input decoration style" or "input appearance".
enum NbxInputDecorationStyle {
  /// Label appears inside the input field (floating label behavior)
  floating,

  /// Label appears above the input field
  outlined,

  /// Only hint text is shown (no label)
  filled;

  /// Returns true if the style is [filled].
  ///
  /// @returns: Whether the style is filled [bool].
  bool get isFilled {
    return this == NbxInputDecorationStyle.filled;
  }

  /// Returns true if the style is [outlined].
  ///
  /// @returns: Whether the style is outlined [bool].
  bool get isOutlined {
    return this == NbxInputDecorationStyle.outlined;
  }

  /// Returns true if the style is [floating].
  ///
  /// @returns: Whether the style is floating [bool].
  bool get isFloating {
    return this == NbxInputDecorationStyle.floating;
  }
}

/// Defines the type of suffix icon to show automatically in the input field.
///
/// - [none]: No automatic suffix icon.
/// - [eye]: Toggles password visibility (use with obscureText inputs).
/// - [cancel]: Clears the input field content.
enum NbxSuffixIconType { none, eye, cancel }

/// Defines the visual state of an input field.
///
/// - [neutral]: Default state — no success/error indicators.
/// - [success]: Field is valid — shows success border and optional check icon.
/// - [error]: Field has errors — handled automatically by Flutter's validation.
enum NbxInputState { neutral, success, error }
