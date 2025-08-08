import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import 'package:nebux_design_system/src/components/scaffold/nbx_app_bar.dart';

/// A custom scaffold widget that provides a consistent layout structure
/// with enhanced functionality for Nebux applications.
class NbxScaffold extends StatelessWidget {
  /// The main content widget to be displayed in the scaffold body.
  final Widget body;

  /// Custom app bar widget. If provided, overrides the built-in app bar.
  final PreferredSizeWidget? appBar;

  /// Configuration for the app bar properties.
  final AppBarConfig? appBarConfig;

  /// Configuration for safe area properties.
  final SafeAreaConfig? safeAreaConfig;

  /// Configuration for body properties.
  final BodyConfig? bodyConfig;

  /// Bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// Floating action button widget.
  final Widget? floatingActionButton;

  /// Location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Background color for the scaffold.
  final Color? backgroundColor;

  /// Name of the widget to be used for debugging purposes.
  final String widgetName;

  /// Creates a custom scaffold widget with enhanced functionality.
  const NbxScaffold({
    required this.body,
    this.appBar,
    this.appBarConfig,
    this.safeAreaConfig,
    this.bodyConfig,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    required this.widgetName,
    super.key,
  });

  bool get _hasAppBar =>
      appBarConfig != null &&
      (appBarConfig!.title != null ||
          appBarConfig!.actions != null ||
          appBarConfig!.leadingButton != null);

  @override
  Widget build(BuildContext context) {
    final safeArea = safeAreaConfig ?? const SafeAreaConfig();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor ?? context.nebuxColors.background,
      appBar: _hasAppBar ? NbxAppBar(appBarConfig: appBarConfig!) : appBar,
      resizeToAvoidBottomInset: bodyConfig?.resizeToAvoidBottomInset ?? false,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        left: false,
        right: false,
        top: safeArea.top,
        bottom: safeArea.bottom,
        minimum: safeArea.minimum ?? const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            if (_hasAppBar && appBarConfig?.showDivider == true)
              Divider(height: 0, color: Colors.grey.shade500, thickness: .2),
            Expanded(child: _buildScaffoldBody()),
          ],
        ),
      ),
    );
  }

  /// Builds the scaffold body with optional container wrapping and double back functionality.
  Widget _buildScaffoldBody() {
    final config = bodyConfig ?? const BodyConfig(wrapInContainer: true);
    Widget childWidget = body;
    if (config.wrapInContainer) {
      childWidget = Container(
        decoration: config.decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddingSize),
          child: childWidget,
        ),
      );
    }

    if (config.exitMessage != null) {
      return DoubleBackToExit(
        snackBarMessage: config.exitMessage!,
        child: childWidget,
      );
    }

    return childWidget;
  }
}
