part of 'validation_rule.dart';

/// Phone validation rules
class PhoneValidationRules {
  /// Valid phone format
  static ValidationRule validFormat([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Invalid phone format';
    return ValidationRule(
      validator: (value) => _isValidPhone(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Minimum length for phone
  static ValidationRule minLength(int minLength, [String? errorMessage]) {
    final errorMessageText = 'Phone must be at least $minLength digits';
    return ValidationRule(
      validator: (value) => value.length >= minLength ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  // Helper method
  static bool _isValidPhone(String value) {
    final regExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regExp.hasMatch(value);
  }
}
