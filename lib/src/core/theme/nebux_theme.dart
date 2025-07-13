import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nebux_core/src/core/theme/extensions/nebux_extension.dart';
import 'colors/nebux_colors.dart';
import 'typography/nebux_typography.dart';

/// NebuX Core Theme System
///
/// Main theme class that integrates colors, typography, and spacing.
/// Provides a comprehensive design system for the NebuX Core application.
class NebuxTheme extends ThemeExtension<NebuxTheme> {
  final NebuxColors colors;
  final NebuxTypography typography;

  const NebuxTheme._({required this.colors, required this.typography});

  /// Create a custom theme with specific colors
  /// This allows users to define their own theme colors
  factory NebuxTheme.custom({
    required NebuxColors colors,
    NebuxTypography? typography,
  }) {
    return NebuxTheme._(
      colors: colors,
      typography: typography ?? NebuxTypography(),
    );
  }

  /// Create theme from JSON
  /// This allows users to load their theme from JSON data
  static NebuxTheme fromJson(Map<String, dynamic> json) {
    final colors = NebuxColors.fromJson(json);
    return NebuxTheme.custom(colors: colors);
  }

  /// Create theme from color themes with specific brightness
  /// This allows users to provide both light and dark themes and select one
  static NebuxTheme fromColorThemes({
    required NebuxColorThemes colorThemes,
    required Brightness brightness,
    NebuxTypography? typography,
  }) {
    final colors = colorThemes.getColorsByBrightness(brightness);
    return NebuxTheme.custom(colors: colors, typography: typography);
  }

  @override
  NebuxTheme copyWith({NebuxColors? colors, NebuxTypography? typography}) {
    return NebuxTheme._(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
    );
  }

  @override
  NebuxTheme lerp(NebuxTheme? other, double t) {
    if (other == null) return this;

    final nebuxColors = NebuxColors.lerp(colors, other.colors, t) ?? colors;
    return NebuxTheme._(colors: nebuxColors, typography: other.typography);
  }

  /// Create ThemeData for Flutter's Material App
  static ThemeData createThemeData(NebuxColors colors, bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,

      // Color scheme
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary,
        onPrimary: colors.white,
        secondary: colors.secondary,
        onSecondary: colors.black,
        error: colors.error,
        onError: colors.white,
        surface: colors.white,
        onSurface: colors.black,
        surfaceContainerHighest: colors.white,
        onSurfaceVariant: colors.black,
        outline: colors.black,
        shadow: colors.black,
        scrim: colors.black,
        inverseSurface: colors.black,
        onInverseSurface: colors.white,
        inversePrimary: colors.primary,
        surfaceTint: colors.primary,
      ),

      // Scaffold
      scaffoldBackgroundColor: colors.scaffold,

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: colors.scaffold,
        foregroundColor: colors.black,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f18,
          color: colors.black,
        ),
        iconTheme: IconThemeData(color: colors.black, size: 24),
        actionsIconTheme: IconThemeData(color: colors.black, size: 24),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.scaffold,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.black,
        selectedLabelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f12,
        ),
        unselectedLabelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f12,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: colors.white,
        elevation: 2,
        shadowColor: colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f14,
          color: colors.black,
        ),
        hintStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f14,
          color: colors.black,
        ),
        errorStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f12,
          color: colors.error,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          elevation: 2,
          shadowColor: colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: NebuxTypography.f14,
          ),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: NebuxTypography.f14,
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: NebuxTypography.f14,
          ),
        ),
      ),

      // Filled button theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: NebuxTypography.f14,
          ),
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colors.black,
        thickness: 1,
        space: 1,
      ),

      // Icon theme
      iconTheme: IconThemeData(color: colors.black, size: 24),

      // Text theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w800,
          fontSize: NebuxTypography.f36,
          color: colors.black,
        ),
        displayMedium: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: NebuxTypography.f28,
          color: colors.black,
        ),
        displaySmall: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f24,
          color: colors.black,
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
          fontSize: NebuxTypography.f32,
          color: colors.black,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f24,
          color: colors.black,
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f20,
          color: colors.black,
        ),
        titleLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f18,
          color: colors.black,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f16,
          color: colors.black,
        ),
        titleSmall: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f14,
          color: colors.black,
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f16,
          color: colors.black,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f14,
          color: colors.black,
        ),
        bodySmall: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: NebuxTypography.f12,
          color: colors.black,
        ),
        labelLarge: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: NebuxTypography.f14,
          color: colors.black,
        ),
        labelMedium: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f12,
          color: colors.black,
        ),
        labelSmall: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: NebuxTypography.f10,
          color: colors.black,
        ),
      ),

      // Extensions
      extensions: <ThemeExtension<NebuxTheme>>[
        NebuxTheme._(colors: colors, typography: NebuxTypography()),
      ],
    );
  }
}
