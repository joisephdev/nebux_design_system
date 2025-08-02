part of 'export.dart';

extension NbxInputParametersExtension on NbxInputParameters {
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

  Widget? buildSuffixIcon({
    required bool showCancelIcon,
    required bool obscureText,
    void Function()? onTap,
  }) {
    if (!showSuffixIcon ||
        ((isReadOnly || !isEnabled) && !forceShowSuffixIcon)) {
      return null;
    }

    if (suffixIcon != null) {
      return suffixIcon;
    }

    if (showCancelIcon) {
      return GestureDetector(
        onTap: () => controller?.clear(),
        child: Container(
          color: Colors.transparent,
          child: const Icon(Icons.cancel, size: 18, color: Colors.grey),
        ),
      );
    }

    if (showEyeIcon) {
      IconData icon = Icons.visibility_off;
      if (obscureText) {
        icon = Icons.visibility;
      }

      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Icon(icon, color: Colors.grey),
        ),
      );
    }

    return decoration?.suffixIcon;
  }
}
