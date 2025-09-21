import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Enum defining the different button variants.
enum ButtonVariant {
  /// Filled button with filled background.
  filled,

  /// Text button with outlined style.
  text,

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

  /// Whether the button is enabled.
  final bool enabled;

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

  /// The color of the button.
  final Color? customBackgroundColor;

  /// Whether the button is selected.
  final bool isSelected;

  const NbxButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.isExpanded = true,
    this.borderRadius,
    this.textStyle,
    this.icon,
    this.trailingIcon,
    this.variant = ButtonVariant.filled,
    this.iconColor,
    this.trailingIconColor,
    this.customBackgroundColor,
    this.isSelected = false,
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
    final bool shouldDisable = isLoading || !enabled;

    switch (variant) {
      case ButtonVariant.filled:
        return FilledButton(
          onPressed: shouldDisable ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: shouldDisable ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: shouldDisable ? null : onPressed,
          style: _getButtonStyle(context),
          child: _buildButtonContent(context),
        );
      case ButtonVariant.danger:
        return FilledButton(
          onPressed: shouldDisable ? null : onPressed,
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

    final bool shouldDisable = isLoading || !enabled;
    final NebuxColors colors = context.nebuxColors;
    final Color disabledColor = colors.disabled;

    final List<Widget> children = <Widget>[];

    // Build the leading icon widget
    if (icon != null) {
      children.add(
        Icon(icon, size: 18, color: shouldDisable ? disabledColor : iconColor),
      );

      children.add(widthSpace8);
    }

    // Build the text widget
    children.add(_buildTextWidget(context, shouldDisable, disabledColor));

    // Build the trailing icon widget
    if (trailingIcon != null) {
      children.add(widthSpace8);
      children.add(
        Icon(
          trailingIcon,
          size: 18,
          color: shouldDisable ? disabledColor : trailingIconColor,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  /// Builds the text widget for the button.
  ///
  /// @param context: The build context [BuildContext]
  /// @param shouldDisable: Whether the button is disabled [bool]
  /// @param disabledColor: The color of the disabled text [Color]
  /// @returns: [Widget]
  Widget _buildTextWidget(
    BuildContext context,
    bool shouldDisable,
    Color disabledColor,
  ) {
    Widget baseTextWidget(TextStyle style) => Flexible(
      child: Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.fade,
        softWrap: true,
        style: style,
      ).nbxPaddingOnly(top: 3),
    );

    switch (variant) {
      case ButtonVariant.text:
        return baseTextWidget(
          (textStyle ?? context.nebuxTheme.typography.content).copyWith(
            color: shouldDisable ? disabledColor : null,
          ),
        );
      case ButtonVariant.outline:
        return baseTextWidget(
          (textStyle ?? context.nebuxTheme.typography.content).copyWith(
            color: shouldDisable ? disabledColor : null,
          ),
        );
      case ButtonVariant.filled:
      case ButtonVariant.danger:
        return baseTextWidget(
          (textStyle ?? context.nebuxTheme.typography.secondaryAction).copyWith(
            color: shouldDisable ? disabledColor : null,
          ),
        );
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final NebuxColors colors = context.nebuxColors;
    final double borderRadiusValue = borderRadius ?? 8;
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue),
    );

    final bool shouldDisable = isLoading || !enabled;

    switch (variant) {
      case ButtonVariant.filled:
        return FilledButton.styleFrom(
          shape: shape,
          elevation: 0,
          backgroundColor: shouldDisable
              ? colors.disabled
              : customBackgroundColor ?? colors.actionPrimary,
          foregroundColor: shouldDisable ? colors.textSecondary : Colors.white,
        );
      case ButtonVariant.text:
        return TextButton.styleFrom(
          shape: shape,
          foregroundColor: shouldDisable
              ? colors.textSecondary.withValues(alpha: 0.5)
              : colors.actionPrimary,
          textStyle: context.nebuxTheme.typography.caption.copyWith(
            decoration: TextDecoration.underline,
          ),
        );
      case ButtonVariant.outline:
        return OutlinedButton.styleFrom(
          shape: shape,
          backgroundColor: isSelected ? colors.primary : Colors.white,
          foregroundColor: shouldDisable
              ? colors.textSecondary.withValues(alpha: 0.5)
              : isSelected
              ? Colors.white
              : colors.actionPrimary,
          side: BorderSide(
            color: shouldDisable
                ? colors.textSecondary.withValues(alpha: 0.3)
                : colors.textSecondary,
            width: .2,
          ),
        );
      case ButtonVariant.danger:
        return FilledButton.styleFrom(
          shape: shape,
          elevation: 0,
          backgroundColor: shouldDisable
              ? colors.textSecondary.withValues(alpha: 0.3)
              : colors.error,
          foregroundColor: shouldDisable ? colors.textSecondary : Colors.white,
        );
    }
  }
}
