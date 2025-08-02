import 'package:flutter/material.dart';

/// Configuration class for AppBar properties in NbxScaffold.
class AppBarConfig {
  /// Title widget to display in the app bar.
  final Widget? title;

  /// Action widgets to display in the app bar.
  final List<Widget>? actions;

  /// Custom leading button widget for the app bar.
  final Widget? leadingButton;

  /// Whether to center the title in the app bar.
  final bool centerTitle;

  /// Whether to show a divider below the app bar.
  final bool showDivider;

  const AppBarConfig({
    this.title,
    this.actions,
    this.leadingButton,
    this.centerTitle = true,
    this.showDivider = false,
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

  const BodyConfig({
    this.wrapInContainer = true,
    this.decoration,
    this.resizeToAvoidBottomInset = false,
    this.exitMessage,
  });
}
