import 'package:flutter/material.dart';

/// Configuration class for AppBar properties in NbxScaffold.
class AppBarConfig {
  /// Title widget to display in the app bar.
  final String? title;

  /// Action widgets to display in the app bar.
  final List<Widget>? actions;

  /// Custom leading button widget for the app bar.
  final Widget? leadingButton;

  /// Whether to center the title in the app bar.
  final bool centerTitle;

  /// Whether to show a divider below the app bar.
  final bool showDivider;

  /// Thickness of the divider below the app bar.
  final double dividerThickness;

  /// Background color for the app bar.
  final Color? backgroundColor;

  const AppBarConfig({
    this.title,
    this.actions,
    this.leadingButton,
    this.centerTitle = false,
    this.showDivider = false,
    this.dividerThickness = 0.2,
    this.backgroundColor,
  });
}

/// Configuration class for SafeArea properties in NbxScaffold.
class SafeAreaConfig {
  /// Whether to apply safe area to the top of the screen.
  final bool top;

  /// Whether to apply safe area to the bottom of the screen.
  final bool bottom;

  /// Minimum padding for the safe area.
  final EdgeInsets? minimum;

  const SafeAreaConfig({this.top = true, this.bottom = true, this.minimum});
}

/// Configuration class for Body properties in NbxScaffold.
class BodyConfig {
  /// Whether to wrap the body in a container with decoration and padding.
  final bool wrapInContainer;

  /// Decoration to apply to the body container when [wrapInContainer] is true.
  final Decoration? decoration;

  /// Whether the body should resize to avoid the bottom inset (keyboard).
  final bool resizeToAvoidBottomInset;

  /// Message to display when double back to exit is triggered.
  final String? exitMessage;

  /// Whether the body should extend behind the app bar.
  final bool extendBodyBehindAppBar;

  const BodyConfig({
    this.wrapInContainer = true,
    this.decoration,
    this.resizeToAvoidBottomInset = false,
    this.extendBodyBehindAppBar = true,
    this.exitMessage,
  });
}
