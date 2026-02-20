import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A full-width social login button (e.g., Google, Apple, Facebook).
///
/// Renders an icon and label side-by-side with configurable styling
/// for both filled and outlined appearances.
class NbxSocialLoginButton extends StatelessWidget {
  /// The button label text.
  final String text;

  /// The social provider icon widget.
  final Widget icon;

  /// Callback invoked when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to render as an outlined (border-only) button.
  final bool isOutlined;

  /// Custom background color override.
  final Color? backgroundColor;

  /// Custom text color override.
  final Color? textColor;

  /// Custom border color override for outlined style.
  final Color? borderColor;

  /// Creates a social login button.
  const NbxSocialLoginButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<NebuxColors>();

    final buttonColor =
        backgroundColor ??
        (isOutlined ? Colors.transparent : colors?.black ?? Colors.black);

    final buttonTextColor =
        textColor ??
        (isOutlined
            ? colors?.black ?? Colors.black
            : colors?.white ?? Colors.white);

    final buttonBorderColor = borderColor ?? colors?.black ?? Colors.black;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon, //FaIcon(icon, color: buttonTextColor, size: 20),
        label: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            color: buttonTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: buttonTextColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: isOutlined
              ? BorderSide(color: buttonBorderColor, width: 1.5)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
