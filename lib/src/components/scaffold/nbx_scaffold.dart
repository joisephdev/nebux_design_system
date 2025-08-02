import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// A custom scaffold widget that provides a consistent layout structure
/// with enhanced functionality for Nebux applications.
class NbxScaffold extends StatelessWidget {
  /// The main content widget to be displayed in the scaffold body.
  final Widget body;

  /// Custom app bar widget. If provided, overrides the built-in app bar.
  final PreferredSizeWidget? appBar;

  /// Whether to apply safe area to the top of the screen.
  /// Defaults to `true`.
  final bool safeAreaTop;

  /// Decoration to apply to the body container when [wrapBodyInContainer] is true.
  final Decoration? decoration;

  /// Minimum padding for the safe area.
  /// Defaults to `EdgeInsets.only(bottom: 20)`.
  final EdgeInsets? minimum;

  /// Whether the body should resize to avoid the bottom inset (keyboard).
  /// Defaults to `false`.
  final bool resizeToAvoidBottomInset;

  /// Whether to wrap the body in a container with decoration and padding.
  /// Defaults to `true`.
  final bool wrapBodyInContainer;

  /// Whether to apply safe area to the bottom of the screen.
  /// Defaults to `true`.
  final bool safeAreaBottom;

  /// Bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// Title widget to display in the app bar.
  /// Only used when [appBar] is null.
  final Widget? title;

  /// Action widgets to display in the app bar.
  /// Only used when [appBar] is null.
  final List<Widget>? actions;

  /// Custom leading button widget for the app bar.
  /// Only used when [appBar] is null.
  final Widget? leadingButton;

  /// Whether to center the title in the app bar.
  /// Defaults to `true`.
  final bool centerTitleAppBar;

  /// Message to display when double back to exit is triggered.
  /// If null, double back to exit functionality is disabled.
  final String? exitMessage;

  /// Floating action button widget.
  final Widget? floatingActionButton;

  /// Location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Background color for the scaffold.
  /// If null, uses the theme's background color.
  final Color? backgroundColor;

  /// Whether to show a divider below the app bar.
  /// Defaults to `false`.
  final bool showDivider;

  /// Creates a custom scaffold widget with enhanced functionality.
  const NbxScaffold({
    required this.body,
    this.appBar,
    this.minimum,
    this.decoration,
    this.bottomNavigationBar,
    this.title,
    this.actions,
    this.leadingButton,
    this.centerTitleAppBar = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.wrapBodyInContainer = true,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.exitMessage,
    this.backgroundColor,
    this.showDivider = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.nebuxColors.background,
      extendBodyBehindAppBar: true,
      appBar: appBar ?? _appBar(context),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        left: false,
        right: false,
        top: safeAreaTop,
        bottom: safeAreaBottom,
        minimum: minimum ?? const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            if ((title != null || actions != null || leadingButton != null) &&
                showDivider)
              const Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: Divider(height: 0),
              ),
            Expanded(child: _buildScaffoldBody()),
          ],
        ),
      ),
    );
  }

  /// Builds the app bar widget based on the provided parameters.
  PreferredSizeWidget? _appBar(BuildContext context) {
    if (title != null || actions != null || leadingButton != null) {
      return AppBar(
        titleSpacing: 0,
        title: title,
        actions: actions,
        automaticallyImplyLeading: false,
        leading: leadingButton,
        centerTitle: centerTitleAppBar,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      );
    }

    return null;
  }

  /// Builds the scaffold body with optional container wrapping and double back functionality.
  Widget _buildScaffoldBody() {
    Widget childWidget = body;
    if (wrapBodyInContainer == true) {
      childWidget = Container(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: childWidget,
        ),
      );
    }

    if (exitMessage != null) {
      return DoubleBackToExit(
        snackBarMessage: exitMessage!,
        child: childWidget,
      );
    }

    return childWidget;
  }
}
