import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'nebux_font_size.dart';

part 'nebux_typography.freezed.dart';

/// NebuX Core Typography System
///
/// Defines font sizes, styles, and typography hierarchy for the NebuX Core design system.
@Freezed(fromJson: false, toJson: false)
abstract class NebuxTypography with _$NebuxTypography {
  /// Creates a [NebuxTypography] instance.
  const factory NebuxTypography({
    required TextStyle bodyLarge,

    /// Style for medium body text (e.g., default content, paragraphs).
    required TextStyle bodyMedium,

    /// Style for small body text (e.g., captions, metadata).
    required TextStyle bodySmall,

    /// Style for large labels (e.g., headings, titles).
    required TextStyle labelLarge,

    /// Style for medium labels (e.g., section headers).
    required TextStyle labelMedium,

    /// Style for small labels (e.g., timestamps, status).
    required TextStyle labelSmall,

    /// Style for CTA (Call to Action) buttons.
    required TextStyle cta,

    /// Style for alternative buttons.
    required TextStyle alternative,

    /// Style for input text fields.
    required TextStyle input,

    /// Style for placeholder text.
    required TextStyle placeholder,
  }) = _NebuxTypography;

  const NebuxTypography._();

  /// Creates a standard set of text styles using Google Fonts Montserrat.
  factory NebuxTypography.standard() {
    final fontSizes = NebuxFontSize.standard();
    return NebuxTypography(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: fontSizes.extraLarge,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: fontSizes.medium,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: fontSizes.heading4,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: fontSizes.small,
        fontWeight: FontWeight.w500,
      ),
      cta: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w700,
      ),
      alternative: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w600,
      ),
      input: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w400,
      ),
      placeholder: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  /// Creates [NebuxTypography] from a Material [ThemeData].
  factory NebuxTypography.fromThemeData(ThemeData themeData) => NebuxTypography(
    bodyLarge: themeData.textTheme.bodyLarge!,
    bodyMedium: themeData.textTheme.bodyMedium!,
    bodySmall: themeData.textTheme.bodySmall!,
    labelLarge: themeData.textTheme.labelLarge!,
    labelMedium: themeData.textTheme.labelMedium!,
    labelSmall: themeData.textTheme.labelSmall!,
    cta: themeData.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
    alternative: themeData.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.w600,
    ),
    input: themeData.textTheme.bodyMedium!,
    placeholder: themeData.textTheme.bodyMedium!.copyWith(
      fontStyle: FontStyle.italic,
    ),
  );

  /// Creates a custom [NebuxTypography] with individual TextStyle parameters.
  /// All parameters are optional and will use standard values if not provided.
  factory NebuxTypography.custom({
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? cta,
    TextStyle? alternative,
    TextStyle? input,
    TextStyle? placeholder,
  }) {
    final standard = NebuxTypography.standard();
    return NebuxTypography(
      bodyLarge: bodyLarge ?? standard.bodyLarge,
      bodyMedium: bodyMedium ?? standard.bodyMedium,
      bodySmall: bodySmall ?? standard.bodySmall,
      labelLarge: labelLarge ?? standard.labelLarge,
      labelMedium: labelMedium ?? standard.labelMedium,
      labelSmall: labelSmall ?? standard.labelSmall,
      cta: cta ?? standard.cta,
      alternative: alternative ?? standard.alternative,
      input: input ?? standard.input,
      placeholder: placeholder ?? standard.placeholder,
    );
  }

  /// Merges this typography scheme with another [NebuxTypography].
  ///
  /// Styles from [other] take precedence.
  NebuxTypography merge(NebuxTypography? other) {
    if (other == null) return this;
    return copyWith(
      bodyLarge: other.bodyLarge,
      bodyMedium: other.bodyMedium,
      bodySmall: other.bodySmall,
      labelLarge: other.labelLarge,
      labelMedium: other.labelMedium,
      labelSmall: other.labelSmall,
      cta: other.cta,
      alternative: other.alternative,
      input: other.input,
      placeholder: other.placeholder,
    );
  }
}
