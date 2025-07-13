import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// NebuX Core Typography System
///
/// Defines font sizes, styles, and typography hierarchy for the NebuX Core design system.
class NebuxTypography {
  // ==================== FONT SIZES ====================
  /// Font size 8
  static const double f8 = 8.0;

  /// Font size 10
  static const double f10 = 10.0;

  /// Font size 12
  static const double f12 = 12.0;

  /// Font size 13
  static const double f13 = 13.0;

  /// Font size 14
  static const double f14 = 14.0;

  /// Font size 16
  static const double f16 = 16.0;

  /// Font size 18
  static const double f18 = 18.0;

  /// Font size 20
  static const double f20 = 20.0;

  /// Font size 22
  static const double f22 = 22.0;

  /// Font size 24
  static const double f24 = 24.0;

  /// Font size 28
  static const double f28 = 28.0;

  /// Font size 32
  static const double f32 = 32.0;

  /// Font size 36
  static const double f36 = 36.0;

  // ==================== BASE STYLES ====================
  /// Regular text style (FontWeight.w400)
  TextStyle get regular => GoogleFonts.montserrat(fontWeight: FontWeight.w400);

  /// Medium text style (FontWeight.w500)
  TextStyle get medium => GoogleFonts.montserrat(fontWeight: FontWeight.w500);

  /// Semi-bold text style (FontWeight.w600)
  TextStyle get semiBold => GoogleFonts.montserrat(fontWeight: FontWeight.w600);

  /// Bold text style (FontWeight.w700)
  TextStyle get bold => GoogleFonts.montserrat(fontWeight: FontWeight.w700);

  /// Extra bold text style (FontWeight.w800)
  TextStyle get extraBold =>
      GoogleFonts.montserrat(fontWeight: FontWeight.w800);

  // ==================== BUTTON STYLES ====================
  /// CTA (Call to Action) button style
  TextStyle get cta =>
      GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: f12);

  /// Alternative button style
  TextStyle get alternative =>
      GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: f14);

  // ==================== TEXT FIELD STYLES ====================
  /// Label style for text fields
  TextStyle get label =>
      GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: f14);

  /// Input text style
  TextStyle get input =>
      GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: f14);

  /// Placeholder text style
  TextStyle get placeholder => GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontSize: f14,
  );
}
