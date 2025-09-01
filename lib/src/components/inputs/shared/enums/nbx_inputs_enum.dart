enum NbxInputType {
  text,
  alphabet,
  number,
  phone,
  password,
  decimalNumber,
  email,
}

enum NbxFormType {
  /// Label appears inside the input field (floating label behavior)
  floating,

  /// Label appears above the input field
  outlined,

  /// Only hint text is shown (no label)
  filled;

  bool get isFilled {
    return this == NbxFormType.filled;
  }

  bool get isOutlined {
    return this == NbxFormType.outlined;
  }

  bool get isFloating {
    return this == NbxFormType.floating;
  }
}
