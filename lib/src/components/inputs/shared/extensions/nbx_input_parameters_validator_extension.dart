part of 'export.dart';

/// Extension that provides input formatting and validation from [NbxInputParameters].
extension NbxInputParametersValidationExtension on NbxInputParameters {
  /// Returns the list of [TextInputFormatter]s derived from [inputType].
  List<TextInputFormatter> get textInputFormatter {
    late final TextInputFormatter inputFormatter;
    switch (inputType) {
      case NbxInputType.alphabet:
        final alphabetRegex = RegExp(r'^[a-zA-Z\s]+$');
        inputFormatter = FilteringTextInputFormatter.allow(alphabetRegex);
        break;
      case NbxInputType.number:
      case NbxInputType.phone:
        inputFormatter = FilteringTextInputFormatter.digitsOnly;
        break;
      default:
        final isSingleLine = maxLines == null || maxLines == 1;
        if (isSingleLine) {
          inputFormatter = FilteringTextInputFormatter.singleLineFormatter;
        } else {
          inputFormatter = FilteringTextInputFormatter.allow(RegExp(r'.*'));
        }
        break;
    }

    return [...?inputFormatters, inputFormatter];
  }

  /// Validates the input and notifies via [onValidationResult].
  String? inputValidator(String? data) {
    final value = data ?? '';
    String? error;

    if (value.isEmpty) {
      error = isRequired ? requiredErrorMessage : null;
    } else {
      error = validator?.call(data);
    }

    onValidationResult?.call(error);
    return error;
  }
}
