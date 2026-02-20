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
  /// Will be null when button is disabled or loading.
  final VoidCallback? onPressed;

  /// Configuration for button icons (leading and trailing).
  final ButtonIconConfig iconConfig;

  /// Configuration for button styling (variant, colors, text style).
  final ButtonStyleConfig styleConfig;

  /// Configuration for button state (loading, enabled, selected).
  final ButtonStateConfig stateConfig;

  /// Configuration for button layout (expanded width).
  final ButtonLayoutConfig layoutConfig;

  /// Creates a [NbxButton] with the specified properties.
  ///
  /// The [text] and [onPressed] parameters are required.
  /// All configuration objects default to their respective default constructors.
  ///
  /// Parameters:
  /// * [text] - The text to display on the button
  /// * [onPressed] - Callback function when button is pressed
  /// * [iconConfig] - Icon configuration (optional)
  /// * [styleConfig] - Style configuration (optional)
  /// * [stateConfig] - State configuration (optional)
  /// * [layoutConfig] - Layout configuration (optional)
  const NbxButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconConfig = const ButtonIconConfig(),
    this.styleConfig = const ButtonStyleConfig(),
    this.stateConfig = const ButtonStateConfig(),
    this.layoutConfig = const ButtonLayoutConfig(),
  });

  @override
  Widget build(BuildContext context) {
    final Widget buttonWidget = _buildButtonWidget(context);

    if (layoutConfig.isExpanded) {
      return SizedBox(width: double.infinity, child: buttonWidget);
    }

    return buttonWidget;
  }

  /// Builds the appropriate button widget based on the configured variant.
  ///
  /// Creates a FilledButton, OutlinedButton, TextButton, or danger-styled
  /// FilledButton depending on the [ButtonVariant] specified in styleConfig.
  Widget _buildButtonWidget(BuildContext context) {
    final bool isButtonDisabled = _shouldDisableButton();

    switch (styleConfig.variant) {
      case ButtonVariant.filled:
        return FilledButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: _buildButtonStyle(context),
          child: _buildButtonContent(context),
        );

      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: _buildButtonStyle(context),
          child: _buildButtonContent(context),
        );

      case ButtonVariant.text:
        return TextButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: _buildButtonStyle(context),
          child: _buildButtonContent(context),
        );

      case ButtonVariant.danger:
        return FilledButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: _buildButtonStyle(context),
          child: _buildButtonContent(context),
        );
    }
  }

  /// Builds the button content including loading indicator, icons, and text.
  ///
  /// When loading, displays a circular progress indicator.
  /// Otherwise, arranges leading icon, text, and trailing icon horizontally.
  Widget _buildButtonContent(BuildContext context) {
    if (stateConfig.isLoading) {
      final Color spinnerColor = _getSpinnerColor(context);
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
        ),
      );
    }

    return _buildButtonContentRow(context);
  }

  /// Builds the row containing icon(s) and text content.
  ///
  /// Arranges elements in the following order:
  /// 1. Leading icon (if configured)
  /// 2. Text
  /// 3. Trailing icon (if configured)
  Widget _buildButtonContentRow(BuildContext context) {
    final bool isButtonDisabled = _shouldDisableButton();
    final Color disabledColor = context.nebuxColors.disabled;

    final List<Widget> contentChildren = <Widget>[
      if (iconConfig.icon != null) ...[
        _buildLeadingIcon(isButtonDisabled, disabledColor),
        widthSpace8,
      ],
      _buildTextWidget(context, isButtonDisabled, disabledColor),
      if (iconConfig.trailingIcon != null) ...[
        widthSpace8,
        _buildTrailingIcon(isButtonDisabled, disabledColor),
      ],
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: contentChildren,
    );
  }

  /// Builds the leading icon widget.
  Widget _buildLeadingIcon(bool isDisabled, Color disabledColor) {
    return Icon(
      iconConfig.icon,
      size: 18.0,
      color: isDisabled ? disabledColor : iconConfig.iconColor,
    );
  }

  /// Builds the trailing icon widget.
  Widget _buildTrailingIcon(bool isDisabled, Color disabledColor) {
    return Icon(
      iconConfig.trailingIcon,
      size: 18.0,
      color: isDisabled ? disabledColor : iconConfig.trailingIconColor,
    );
  }

  /// Builds the text widget for the button with appropriate styling.
  ///
  /// Applies variant-specific text styles and handles disabled state coloring.
  /// The text is wrapped in a Flexible widget to handle overflow properly.
  ///
  /// Parameters:
  /// * [context] - Build context for accessing theme
  /// * [isDisabled] - Whether the button is in disabled state
  /// * [disabledColor] - Color to use when disabled
  Widget _buildTextWidget(
    BuildContext context,
    bool isDisabled,
    Color disabledColor,
  ) {
    final TextStyle textStyle = _getTextStyleForVariant(
      context,
      isDisabled,
      disabledColor,
    );

    return Flexible(
      child: Text(
        text,
        maxLines: 3,
        textAlign: TextAlign.center,
        overflow: TextOverflow.fade,
        softWrap: true,
        style: textStyle,
      ).nbxPaddingOnly(top: 0),
    );
  }

  /// Builds the ButtonStyle based on the current variant and state.
  ///
  /// Configures shape, colors, elevation, and borders according to:
  /// * Button variant (filled, outline, text, danger)
  /// * Disabled state
  /// * Selected state (for outline variant)
  /// * Custom colors from styleConfig
  ButtonStyle _buildButtonStyle(BuildContext context) {
    final NebuxColors colors = context.nebuxColors;
    final bool isButtonDisabled = _shouldDisableButton();

    switch (styleConfig.variant) {
      case ButtonVariant.filled:
        return _buildFilledButtonStyle(colors, isButtonDisabled);

      case ButtonVariant.text:
        return _buildTextButtonStyle(context, colors, isButtonDisabled);

      case ButtonVariant.outline:
        return _buildOutlineButtonStyle(colors, isButtonDisabled);

      case ButtonVariant.danger:
        return _buildDangerButtonStyle(colors, isButtonDisabled);
    }
  }

  /// Builds the style for filled button variant.
  ButtonStyle _buildFilledButtonStyle(NebuxColors colors, bool isDisabled) {
    return FilledButton.styleFrom(
      shape: _getButtonShape(),
      elevation: 0,
      backgroundColor: isDisabled
          ? colors.disabled
          : styleConfig.customBackgroundColor ?? colors.actionPrimary,
      foregroundColor: isDisabled ? colors.textSecondary : Colors.white,
    );
  }

  /// Builds the style for text button variant.
  ButtonStyle _buildTextButtonStyle(
    BuildContext context,
    NebuxColors colors,
    bool isDisabled,
  ) {
    return TextButton.styleFrom(
      shape: _getButtonShape(),
      foregroundColor: isDisabled
          ? colors.textSecondary.withValues(alpha: .5)
          : colors.actionPrimary,
      textStyle: context.nebuxTheme.typography.caption.copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }

  /// Builds the style for outline button variant.
  ButtonStyle _buildOutlineButtonStyle(NebuxColors colors, bool isDisabled) {
    /// Gets the border side configuration for outline button variant.
    final Color borderColor = isDisabled
        ? colors.textSecondary.withValues(alpha: .3)
        : colors.textSecondary;

    return OutlinedButton.styleFrom(
      shape: _getButtonShape(),
      backgroundColor: stateConfig.isSelected ? colors.primary : Colors.white,
      foregroundColor: _getOutlineForegroundColor(colors, isDisabled),
      side: BorderSide(color: borderColor, width: 0.1),
    );
  }

  /// Builds the style for danger button variant.
  ButtonStyle _buildDangerButtonStyle(NebuxColors colors, bool isDisabled) {
    return FilledButton.styleFrom(
      shape: _getButtonShape(),
      elevation: 0,
      backgroundColor: isDisabled
          ? colors.textSecondary.withValues(alpha: .3)
          : colors.error,
      foregroundColor: isDisabled ? colors.textSecondary : Colors.white,
    );
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Determines if the button should be disabled.
  ///
  /// A button is disabled when it's in loading state or explicitly disabled.
  bool _shouldDisableButton() {
    return stateConfig.isLoading || !stateConfig.enabled;
  }

  /// Gets the appropriate text style for the current button variant.
  ///
  /// Uses custom text style if provided, otherwise falls back to theme defaults.
  /// Applies disabled color when button is disabled.
  TextStyle _getTextStyleForVariant(
    BuildContext context,
    bool isDisabled,
    Color disabledColor,
  ) {
    final TextStyle baseStyle = _getBaseTextStyleForVariant(context);

    return baseStyle.copyWith(
      color: isDisabled ? disabledColor : baseStyle.color,
    );
  }

  /// Gets the base text style from theme for the current variant.
  TextStyle _getBaseTextStyleForVariant(BuildContext context) {
    final bool isFilledOrDanger =
        styleConfig.variant == ButtonVariant.filled ||
        styleConfig.variant == ButtonVariant.danger;

    if (isFilledOrDanger) {
      return styleConfig.textStyle ??
          context.nebuxTheme.typography.secondaryAction;
    }

    return styleConfig.textStyle ?? context.nebuxTheme.typography.content;
  }

  /// Gets the button shape with configured or default border radius.
  RoundedRectangleBorder _getButtonShape() {
    final double borderRadiusValue = styleConfig.borderRadius ?? 8.0;

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue),
    );
  }

  /// Gets the foreground color for outline button variant.
  ///
  /// Considers disabled state and selected state.
  Color _getOutlineForegroundColor(NebuxColors colors, bool isDisabled) {
    if (isDisabled) {
      return colors.textSecondary.withValues(alpha: .5);
    }

    return stateConfig.isSelected ? Colors.white : colors.actionPrimary;
  }

  /// Gets the appropriate spinner color based on button variant.
  ///
  /// Uses [ButtonStateConfig.loadingColor] if provided, otherwise derives
  /// the color from the button variant for proper contrast.
  Color _getSpinnerColor(BuildContext context) {
    if (stateConfig.loadingColor != null) return stateConfig.loadingColor!;

    final colors = context.nebuxColors;

    return switch (styleConfig.variant) {
      ButtonVariant.filled => colors.white,
      ButtonVariant.danger => colors.white,
      ButtonVariant.outline =>
        stateConfig.isSelected ? colors.white : colors.actionPrimary,
      ButtonVariant.text => colors.actionPrimary,
    };
  }
}
