part of 'validation_rule.dart';

/// Text validation rules
class TextValidationRules {
  /// Minimum length for text
  static ValidationRule minLength(int minLength, [String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Text must be at least $minLength characters';
    return ValidationRule(
      validator: (value) => value.length >= minLength ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Maximum length for text
  static ValidationRule maxLength(int maxLength, [String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Text must be at most $maxLength characters';
    return ValidationRule(
      validator: (value) => value.length <= maxLength ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Only alphabetic characters
  static ValidationRule onlyLetters([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Only letters are allowed';
    return ValidationRule(
      validator: (value) =>
          RegExp(r'^[a-zA-Z\s]+$').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// No numbers allowed
  static ValidationRule noNumbers([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Numbers are not allowed';
    return ValidationRule(
      validator: (value) =>
          !RegExp(r'\d').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }
}
