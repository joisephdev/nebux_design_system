import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Enum defining the different button variants.
enum ButtonVariant {
  /// Primary button with filled background.
  primary,

  /// Secondary button with outlined style.
  secondary,

  /// Outline button with border.
  outline,

  /// Danger button with error color.
  danger,
}

/// A custom button widget that supports different variants and loading states.
class NbxButton extends StatelessWidget {
  /// The text to display on the button.
  final String text;

  /// Callback function called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to show a loading indicator instead of text.
  final bool isLoading;

  /// The visual variant of the button.
  final ButtonVariant variant;

  /// Whether the button should expand to fill available width.
  final bool isExpanded;

  /// Custom border radius for the button.
  final double? borderRadius;

  /// Custom text style for the button.
  final TextStyle? textStyle;

  /// Icon to display before the text.
  final IconData? icon;

  /// The color of the button.
  final Color? iconColor;

  /// Icon to display after the text.
  final IconData? trailingIcon;

  /// The color of the trailing icon.
  final Color? trailingIconColor;

  const NbxButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.trailingIcon,
    this.variant = ButtonVariant.primary,
    this.iconColor,
    this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final Widget buttonWidget = _buildButtonWidget(context);

    if (isExpanded) {
      return SizedBox(width: double.infinity, child: buttonWidget);
    }

    return buttonWidget;
  }

  Widget _buildButtonWidget(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.secondary:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.danger:
        return FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
    }
  }

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    final List<Widget> children = <Widget>[];

    if (icon != null) {
      children.add(Icon(icon, size: 18, color: iconColor));
      children.add(widthSpace8);
    }

    children.add(
      Text(
        text,
        style: textStyle ?? context.nebuxTheme.typography.secondaryAction,
      ),
    );

    if (trailingIcon != null) {
      children.add(widthSpace8);
      children.add(Icon(trailingIcon, size: 18, color: trailingIconColor));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final colors = context.nebuxColors;
    final double borderRadiusValue = borderRadius ?? 8;
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue),
    );

    switch (variant) {
      case ButtonVariant.primary:
        return FilledButton.styleFrom(
          shape: shape,
          elevation: 0,
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
        );
      case ButtonVariant.secondary:
        return TextButton.styleFrom(
          shape: shape,
          foregroundColor: colors.primary,
        );
      case ButtonVariant.outline:
        return OutlinedButton.styleFrom(
          shape: shape,
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textPrimary,
          side: BorderSide(color: colors.textSecondary, width: 1),
        );
      case ButtonVariant.danger:
        return FilledButton.styleFrom(
          shape: shape,
          elevation: 0,
          backgroundColor: colors.error,
          foregroundColor: Colors.white,
        );
    }
  }
}
