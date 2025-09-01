part of 'export.dart';

extension NbxInputParametersValidationExtension on NbxInputParameters {
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
        inputFormatter = FilteringTextInputFormatter.singleLineFormatter;
        break;
    }

    return [...?inputFormatters, inputFormatter];
  }

  String? inputValidator(String? data) {
    print('data: $data');
    final value = data ?? '';
    if (value.isEmpty) {
      if (!isRequired) {
        return null;
      }

      return requiredErrorMessage;
    }

    if (customValidator != null) {
      final result = customValidator?.call(data, inputType);
      if (result != null) {
        return result;
      }
    }

    if (validator != null) {
      return validator?.call(data);
    }

    return null;
  }
}
