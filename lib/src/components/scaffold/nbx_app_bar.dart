import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final leadingButton = _buildLeading(context);
    return AppBar(
      title: _buildTitle(context),
      elevation: 0,
      titleSpacing: leadingButton == null
          ? NavigationToolbar.kMiddleSpacing
          : 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: true,
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: appBarConfig.actions,
      leading: leadingButton,
      centerTitle: appBarConfig.centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: isDarkMode
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
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

    return appBarConfig.leadingButton ??
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.nebuxColors.textPrimary,
          ),
        );
  }
}
