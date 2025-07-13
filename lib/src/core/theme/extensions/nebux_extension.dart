import 'package:flutter/material.dart';
import '../nebux_theme.dart';
import '../colors/nebux_colors.dart';
import '../typography/nebux_typography.dart';

/// Extension on BuildContext to easily access NebuX theme
extension NebuxBuildContextExtension on BuildContext {
  /// Get the NebuX theme from the current context
  NebuxTheme get nebuxTheme => Theme.of(this).extension<NebuxTheme>()!;

  /// Get the NebuX colors from the current context
  NebuxColors get nebuxColors => nebuxTheme.colors;

  /// Get the NebuX typography from the current context
  NebuxTypography get nebuxTypography => nebuxTheme.typography;
}

/// Extension to add utility methods to NebuxColorThemes
extension NebuxColorThemesExtension on NebuxColorThemes {
  /// Get colors based on brightness
  NebuxColors getColorsByBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }
}
