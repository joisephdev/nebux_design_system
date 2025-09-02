library;

part 'email_validation_rules.dart';
part 'number_validation_rules.dart';
part 'password_validation_rules.dart';
part 'phone_validation_rules.dart';
part 'text_validation_rules.dart';

/// Represents a single validation rule with its validator function and error message
class ValidationRule {
  /// The validation function that returns null if valid, error message if invalid
  final String? Function(String value) validator;

  /// The error message to display when validation fails
  final String errorMessage;

  /// Optional condition to determine if this rule should be applied
  /// If null, the rule is always applied
  final bool Function(String value)? condition;

  const ValidationRule({
    required this.validator,
    required this.errorMessage,
    this.condition,
  });

  /// Validates the given value using this rule
  /// Returns null if valid, error message if invalid
  String? validate(String value) {
    // Check if condition exists and if it should be applied
    if (condition != null && !condition!(value)) {
      return null; // Skip this validation
    }

    return validator(value);
  }
}

/// Custom validation rules
class CustomValidationRules {
  /// Custom regex validation
  static ValidationRule regex(RegExp regex, String errorMessage) =>
      ValidationRule(
        validator: (value) => regex.hasMatch(value) ? null : errorMessage,
        errorMessage: errorMessage,
      );

  /// Custom function validation
  static ValidationRule function(
    bool Function(String) validator,
    String errorMessage,
  ) => ValidationRule(
    validator: (value) => validator(value) ? null : errorMessage,
    errorMessage: errorMessage,
  );
}
