import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Generic NbxAppBar widget for reuse across different screens
class NbxAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Configuration for the app bar properties.
  final AppBarConfig appBarConfig;

  /// Constructor for the NbxAppBar widget.
  const NbxAppBar({super.key, required this.appBarConfig});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitle(context),
      backgroundColor: context.nebuxColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: appBarConfig.actions,
      leading: _buildLeading(context),
      centerTitle: appBarConfig.centerTitle,
      /* titleSpacing: appBarConfig.titleSpacing,
      forceMaterialTransparency: appBarConfig.forceMaterialTransparency,
      systemOverlayStyle: appBarConfig.systemOverlayStyle,
      titleTextStyle: appBarConfig.titleTextStyle,
      toolbarHeight: appBarConfig.toolbarHeight,
      toolbarOpacity: appBarConfig.toolbarOpacity,
      toolbarTextStyle: appBarConfig.toolbarTextStyle, */
    );
  }

  /// Builds the title widget for the app bar.
  Widget? _buildTitle(BuildContext context) {
    if (appBarConfig.title == null) return null;

    return Text(
      appBarConfig.title!,
      style: TextStyle(
        color: context.nebuxColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds the leading widget for the app bar.
  Widget? _buildLeading(BuildContext context) {
    if (appBarConfig.leadingButton == null) return null;

    return IconButton(
      onPressed: Navigator.of(context).pop,
      icon: Icon(Icons.arrow_back_ios, color: context.nebuxColors.textPrimary),
    );
  }
}
