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
  /// If null, uses the theme's background color.
  final Color? backgroundColor;

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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = safeAreaConfig ?? const SafeAreaConfig();
    final appBarConfig = this.appBarConfig;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor ?? context.nebuxColors.background,
      appBar: appBar ?? _appBar(context),
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
            if (appBarConfig != null &&
                (appBarConfig.title != null ||
                    appBarConfig.actions != null ||
                    appBarConfig.leadingButton != null) &&
                appBarConfig.showDivider)
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
    final config = appBarConfig;
    if (config == null) return null;

    if (config.title != null ||
        config.actions != null ||
        config.leadingButton != null) {
      return AppBar(
        titleSpacing: 0,
        title: config.title,
        actions: config.actions,
        automaticallyImplyLeading: false,
        leading: config.leadingButton,
        centerTitle: config.centerTitle,
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
    final config = bodyConfig ?? const BodyConfig();

    Widget childWidget = body;
    if (config.wrapInContainer) {
      childWidget = Container(
        decoration: config.decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
