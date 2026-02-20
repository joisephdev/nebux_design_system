part of 'export.dart';

/// Extension that derives keyboard type and suffix icon from [NbxInputParameters].
extension NbxInputParametersExtension on NbxInputParameters {
  /// Returns the appropriate [TextInputType] based on [inputType].
  TextInputType get keyboardType {
    switch (inputType) {
      case NbxInputType.number:
        return TextInputType.number;
      case NbxInputType.email:
        return TextInputType.emailAddress;
      case NbxInputType.phone:
        return TextInputType.phone;
      case NbxInputType.password:
        return TextInputType.visiblePassword;
      case NbxInputType.decimalNumber:
        return const TextInputType.numberWithOptions(decimal: true);
      default:
        return TextInputType.text;
    }
  }

  /// Builds the automatic suffix icon (eye toggle or cancel) if configured.
  Widget? buildSuffixIcon({required bool obscureText, void Function()? onTap}) {
    // Custom suffix widget always takes priority, even in read-only/disabled state.
    if (suffixIcon != null) return suffixIcon;

    // Automatic icons are not shown in read-only or disabled state.
    if (isReadOnly || !isEnabled) return null;

    return switch (suffixIconType) {
      NbxSuffixIconType.cancel => GestureDetector(
          onTap: () => controller?.clear(),
          child: Container(
            color: Colors.transparent,
            child: const Icon(Icons.cancel, size: 18, color: Colors.grey),
          ),
        ),
      NbxSuffixIconType.eye => GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
      NbxSuffixIconType.none => null,
    };
  }
}
