part of 'validation_rule.dart';

/// Number validation rules
class NumberValidationRules {
  /// Valid number format
  static ValidationRule validFormat([String? errorMessage]) {
    final errorMessageText = errorMessage ?? 'Invalid number format';
    return ValidationRule(
      validator: (value) =>
          double.tryParse(value) != null ? null : errorMessageText,
      errorMessage: errorMessageText,
    );
  }

  /// Minimum value
  static ValidationRule minValue(double minValue, [String? errorMessage]) {
    final errorMessageText = 'Value must be at least $minValue';
    return ValidationRule(
      validator: (value) {
        final num = double.tryParse(value);
        return (num != null && num >= minValue) ? null : errorMessageText;
      },
      errorMessage: errorMessageText,
    );
  }

  /// Maximum value
  static ValidationRule maxValue(double maxValue, [String? errorMessage]) {
    final errorMessageText = 'Value must be at most $maxValue';
    return ValidationRule(
      validator: (value) {
        final num = double.tryParse(value);
        return (num != null && num <= maxValue) ? null : errorMessageText;
      },
      errorMessage: errorMessageText,
    );
  }
}
