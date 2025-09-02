part of 'validation_rule.dart';

/// Password validation rules
class PasswordValidationRules {
  /// Minimum length for password
  static ValidationRule minLength(int minLength, [String? errorMessage]) {
    final errorMessageText = 'Password must be at least $minLength characters';
    return ValidationRule(
      validator: (value) => value.length >= minLength ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain numbers
  static ValidationRule hasNumbers([String? errorMessage]) {
    final errorMessageText = 'Password must contain at least one number';
    return ValidationRule(
      validator: (value) =>
          RegExp(r'[0-9]').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain letters
  static ValidationRule hasLetters([String? errorMessage]) {
    final errorMessageText = 'Password must contain at least one letter';
    return ValidationRule(
      validator: (value) =>
          RegExp(r'[a-zA-Z]').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain uppercase letters
  static ValidationRule hasUppercase([String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Password must contain at least one uppercase letter';
    return ValidationRule(
      validator: (value) =>
          RegExp(r'[A-Z]').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain lowercase letters
  static ValidationRule hasLowercase([String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Password must contain at least one lowercase letter';
    return ValidationRule(
      validator: (value) =>
          RegExp(r'[a-z]').hasMatch(value) ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain special characters
  static ValidationRule hasSpecialChars([String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Password must contain at least one special character';
    return ValidationRule(
      validator: (value) => RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)
          ? null
          : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Password must contain both numbers and letters
  static ValidationRule hasNumbersAndLetters([String? errorMessage]) {
    final errorMessageText =
        errorMessage ?? 'Password must contain both numbers and letters';
    return ValidationRule(
      validator: (value) {
        final hasNumbers = RegExp(r'[0-9]').hasMatch(value);
        final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);
        return (hasNumbers && hasLetters) ? null : errorMessageText;
      },

      errorMessage: errorMessageText,
    );
  }
}
