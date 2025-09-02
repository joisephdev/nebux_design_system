part of 'validation_rule.dart';

/// Email validation rules
class EmailValidationRules {
  /// Valid email format
  static ValidationRule validFormat([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Invalid email format';
    return ValidationRule(
      validator: (value) => _isValidEmail(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Minimum length for email
  static ValidationRule minLength(int minLength, [String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Email must be at least $minLength characters';
    return ValidationRule(
      validator: (value) => value.length >= minLength ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Only Yahoo emails allowed
  static ValidationRule yahooOnly([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Only Yahoo emails are allowed';
    return ValidationRule(
      validator: (value) =>
          value.endsWith('@yahoo.com') ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Email cannot contain numbers
  static ValidationRule noNumbers([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Email cannot contain numbers';
    return ValidationRule(
      validator: (value) =>
          !RegExp(r'\d').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Email must contain specific domain
  static ValidationRule domainOnly(String domain, [String? errorMessage]) {
    final errorMessageText = 'Only $domain emails are allowed';
    return ValidationRule(
      validator: (value) =>
          value.endsWith('@$domain') ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  // Helper method
  static bool _isValidEmail(String value) {
    final regExp = RegExp(
      r'[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}',
    );

    return regExp.hasMatch(value);
  }
}
