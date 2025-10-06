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

  /// Configuration for button icons.
  final ButtonIconConfig iconConfig;

  /// Configuration for button styling.
  final ButtonStyleConfig styleConfig;

  /// Configuration for button state.
  final ButtonStateConfig stateConfig;

  /// Configuration for button layout.
  final ButtonLayoutConfig layoutConfig;

  /// Creates a [NbxButton] with the specified properties.
  ///
  /// @param text: The text to display on the button [String]
  /// @param onPressed: Callback function called when the button is pressed [VoidCallback?]
  /// @param iconConfig: Configuration for button icons [ButtonIconConfig]
  /// @param styleConfig: Configuration for button styling [ButtonStyleConfig]
  /// @param stateConfig: Configuration for button state [ButtonStateConfig]
  /// @param layoutConfig: Configuration for button layout [ButtonLayoutConfig]
  const NbxButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconConfig = const ButtonIconConfig(),
    this.styleConfig = const ButtonStyleConfig(),
    this.stateConfig = const ButtonStateConfig(),
    this.layoutConfig = const ButtonLayoutConfig(),
  });

  /// Creates a [NbxButton] with backward compatibility for individual properties.
  ///
  /// This constructor maintains compatibility with the previous API while
  /// internally using the new configuration classes.
  ///
  /// @param text: The text to display on the button [String]
  /// @param onPressed: Callback function called when the button is pressed [VoidCallback?]
  /// @param isLoading: Whether to show a loading indicator instead of text [bool]
  /// @param enabled: Whether the button is enabled [bool]
  /// @param isExpanded: Whether the button should expand to fill available width [bool]
  /// @param borderRadius: Custom border radius for the button [double?]
  /// @param textStyle: Custom text style for the button [TextStyle?]
  /// @param icon: Icon to display before the text [IconData?]
  /// @param trailingIcon: Icon to display after the text [IconData?]
  /// @param variant: The visual variant of the button [ButtonVariant]
  /// @param iconColor: The color of the leading icon [Color?]
  /// @param trailingIconColor: The color of the trailing icon [Color?]
  /// @param customBackgroundColor: Custom background color for the button [Color?]
  /// @param isSelected: Whether the button is selected [bool]
  NbxButton.legacy({
    super.key,
    required this.text,
    required this.onPressed,
    bool isLoading = false,
    bool enabled = true,
    bool isExpanded = true,
    double? borderRadius,
    TextStyle? textStyle,
    IconData? icon,
    IconData? trailingIcon,
    ButtonVariant variant = ButtonVariant.filled,
    Color? iconColor,
    Color? trailingIconColor,
    Color? customBackgroundColor,
    bool isSelected = false,
  }) : iconConfig = ButtonIconConfig(
         icon: icon,
         iconColor: iconColor,
         trailingIcon: trailingIcon,
         trailingIconColor: trailingIconColor,
       ),
       styleConfig = ButtonStyleConfig(
         variant: variant,
         customBackgroundColor: customBackgroundColor,
         borderRadius: borderRadius,
         textStyle: textStyle,
       ),
       stateConfig = ButtonStateConfig(
         isLoading: isLoading,
         enabled: enabled,
         isSelected: isSelected,
       ),
       layoutConfig = ButtonLayoutConfig(isExpanded: isExpanded);

  @override
  Widget build(BuildContext context) {
    final Widget buttonWidget = _buildButtonWidget(context);

    if (layoutConfig.isExpanded) {
      return SizedBox(width: double.infinity, child: buttonWidget);
    }

    return buttonWidget;
  }

  Widget _buildButtonWidget(BuildContext context) {
    final bool shouldDisable = stateConfig.isLoading || !stateConfig.enabled;

    switch (styleConfig.variant) {
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
    if (stateConfig.isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    final bool shouldDisable = stateConfig.isLoading || !stateConfig.enabled;
    final NebuxColors colors = context.nebuxColors;
    final Color disabledColor = colors.disabled;

    final List<Widget> children = <Widget>[];

    // Build the leading icon widget
    if (iconConfig.icon != null) {
      children.add(
        Icon(
          iconConfig.icon,
          size: 18,
          color: shouldDisable ? disabledColor : iconConfig.iconColor,
        ),
      );

      children.add(widthSpace8);
    }

    // Build the text widget
    children.add(_buildTextWidget(context, shouldDisable, disabledColor));

    // Build the trailing icon widget
    if (iconConfig.trailingIcon != null) {
      children.add(widthSpace8);
      children.add(
        Icon(
          iconConfig.trailingIcon,
          size: 18,
          color: shouldDisable ? disabledColor : iconConfig.trailingIconColor,
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

    switch (styleConfig.variant) {
      case ButtonVariant.text:
        return baseTextWidget(
          (styleConfig.textStyle ?? context.nebuxTheme.typography.content)
              .copyWith(color: shouldDisable ? disabledColor : null),
        );
      case ButtonVariant.outline:
        return baseTextWidget(
          (styleConfig.textStyle ?? context.nebuxTheme.typography.content)
              .copyWith(color: shouldDisable ? disabledColor : null),
        );
      case ButtonVariant.filled:
      case ButtonVariant.danger:
        return baseTextWidget(
          (styleConfig.textStyle ??
                  context.nebuxTheme.typography.secondaryAction)
              .copyWith(color: shouldDisable ? disabledColor : null),
        );
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final NebuxColors colors = context.nebuxColors;
    final double borderRadiusValue = styleConfig.borderRadius ?? 8;
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue),
    );

    final bool shouldDisable = stateConfig.isLoading || !stateConfig.enabled;

    switch (styleConfig.variant) {
      case ButtonVariant.filled:
        return FilledButton.styleFrom(
          shape: shape,
          elevation: 0,
          backgroundColor: shouldDisable
              ? colors.disabled
              : styleConfig.customBackgroundColor ?? colors.actionPrimary,
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
          backgroundColor: stateConfig.isSelected
              ? colors.primary
              : Colors.white,
          foregroundColor: shouldDisable
              ? colors.textSecondary.withValues(alpha: 0.5)
              : stateConfig.isSelected
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
