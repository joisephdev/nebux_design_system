import 'package:nebux_design_system/nebux_design_system.dart';

/// Simple input validation utility
class NbxInputValidator {
  /// Validates input value and returns error message if invalid
  ///
  /// Returns null if valid, error message if invalid
  static String? validate(
    String? value,
    NbxInputType inputType,
    String errorMessage,
  ) {
    // Handle null or empty values
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }

    final trimmedValue = value.trim();
    bool isValid = false;

    switch (inputType) {
      case NbxInputType.email:
        isValid = emailAddress(trimmedValue);
        break;
      case NbxInputType.phone:
        isValid = numberPhone(trimmedValue);
        break;
      case NbxInputType.password:
        isValid = password(trimmedValue);
        break;
      case NbxInputType.alphabet:
      case NbxInputType.onlyText:
        isValid = onlyText(trimmedValue);
        break;
      case NbxInputType.dropdownMenu:
      case NbxInputType.text:
        isValid = trimmedValue.isNotEmpty;
        break;
      case NbxInputType.number:
        isValid = isValidNumber(trimmedValue);
        break;
      case NbxInputType.textAndNumbers:
        isValid = isValidTextAndNumbers(trimmedValue);
        break;
      case NbxInputType.decimalNumber:
        isValid = isValidDecimalNumber(trimmedValue);
        break;
      case NbxInputType.free:
        isValid = true;
        break;
    }

    return isValid ? null : errorMessage;
  }

  /// Validates input value using multiple validation rules
  ///
  /// Returns null if all validations pass, first error message if any validation fails
  static String? validateWithRules(
    String? value,
    List<ValidationRule> validationRules,
  ) {
    // Handle null or empty values
    if (value == null || value.trim().isEmpty) {
      // Check if any rule has a condition that should handle empty values
      for (final rule in validationRules) {
        if (rule.condition != null && rule.condition!('')) {
          final result = rule.validate('');
          if (result != null) return result;
        }
      }
      return null; // Let individual rules handle empty values
    }

    final trimmedValue = value.trim();

    // Apply all validation rules
    for (final rule in validationRules) {
      final result = rule.validate(trimmedValue);
      if (result != null) {
        // Return first validation error
        return result;
      }
    }

    // All validations passed
    return null;
  }

  /// Validates input value using multiple validation rules with custom error handling
  ///
  /// Returns null if all validations pass, custom error message if any validation fails
  static String? validateWithRulesAndCustomError(
    String? value,
    List<ValidationRule> validationRules,
    String Function(String) errorFormatter,
  ) {
    final error = validateWithRules(value, validationRules);
    return error != null ? errorFormatter(error) : null;
  }

  static bool password(String value, [int maxLengthPassword = 6]) {
    final regExp1 = RegExp(r'^.{6,}$');
    return regExp1.hasMatch(value);
  }

  static bool numberPhone(String value) {
    final regExp1 = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regExp1.hasMatch(value);
  }

  static bool emailAddress(String value) {
    // final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final regExp1 = RegExp(
      r'[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}',
    );

    return regExp1.hasMatch(value);
  }

  static bool onlyText(String value) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    // RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
    return regex.hasMatch(value);
  }

  /// Validates if the value is a valid number
  static bool isValidNumber(String value) {
    return double.tryParse(value) != null;
  }

  /// Validates if the value contains only text and numbers
  static bool isValidTextAndNumbers(String value) {
    final regex = RegExp(r'^[a-zA-Z0-9\s]+$');
    return regex.hasMatch(value);
  }

  /// Validates if the value is a valid decimal number
  static bool isValidDecimalNumber(String value) {
    final regex = RegExp(r'^[0-9.]+$');
    return regex.hasMatch(value);
  }
}
