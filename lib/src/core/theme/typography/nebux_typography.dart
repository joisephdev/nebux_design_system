import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

part 'nebux_typography.freezed.dart';

/// NebuX Core Typography System
///
/// Defines font sizes, styles, and typography hierarchy for the NebuX Core design system.
@Freezed(fromJson: false, toJson: false)
abstract class NebuxTypography with _$NebuxTypography {
  /// Creates a [NebuxTypography] instance.
  const factory NebuxTypography({
    /// Style for main content text (e.g., articles, descriptions).
    required TextStyle content,

    /// Style for regular paragraph text (e.g., default content, paragraphs).
    required TextStyle paragraph,

    /// Style for small supporting text (e.g., captions, metadata).
    required TextStyle caption,

    /// Style for main headings (e.g., page titles, primary headers).
    required TextStyle heading,

    /// Style for section headers (e.g., content sections).
    required TextStyle section,

    /// Style for small labels (e.g., timestamps, status).
    required TextStyle label,

    /// Style for primary action buttons.
    required TextStyle primaryAction,

    /// Style for secondary action buttons.
    required TextStyle secondaryAction,

    /// Style for form input text fields.
    required TextStyle formInput,

    /// Style for placeholder text in inputs.
    required TextStyle placeholder,
  }) = _NebuxTypography;

  const NebuxTypography._();

  /// Creates a standard set of text styles using Google Fonts Montserrat.
  factory NebuxTypography.standard() {
    final fontSizes = NebuxFontSize.standard();
    return NebuxTypography(
      label: GoogleFonts.montserrat(
        fontSize: fontSizes.small,
        fontWeight: FontWeight.w500,
      ),
      section: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w500,
      ),
      content: GoogleFonts.montserrat(
        fontSize: fontSizes.extraLarge,
        fontWeight: FontWeight.w400,
      ),
      paragraph: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w400,
      ),
      caption: GoogleFonts.montserrat(
        fontSize: fontSizes.medium,
        fontWeight: FontWeight.w400,
      ),
      heading: GoogleFonts.montserrat(
        fontSize: fontSizes.heading4,
        fontWeight: FontWeight.w600,
      ),

      primaryAction: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w700,
      ),
      secondaryAction: GoogleFonts.montserrat(
        fontSize: fontSizes.large,
        fontWeight: FontWeight.w600,
      ),
      formInput: GoogleFonts.montserrat(
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
    content: themeData.textTheme.bodyLarge!,
    paragraph: themeData.textTheme.bodyMedium!,
    caption: themeData.textTheme.bodySmall!,
    heading: themeData.textTheme.labelLarge!,
    section: themeData.textTheme.labelMedium!,
    label: themeData.textTheme.labelSmall!,
    primaryAction: themeData.textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.w700,
    ),
    secondaryAction: themeData.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.w600,
    ),
    formInput: themeData.textTheme.bodyMedium!,
    placeholder: themeData.textTheme.bodyMedium!.copyWith(
      fontStyle: FontStyle.italic,
    ),
  );

  /// Creates a custom [NebuxTypography] with individual TextStyle parameters.
  /// All parameters are optional and will use standard values if not provided.
  factory NebuxTypography.custom({
    TextStyle? content,
    TextStyle? paragraph,
    TextStyle? caption,
    TextStyle? heading,
    TextStyle? section,
    TextStyle? label,
    TextStyle? primaryAction,
    TextStyle? secondaryAction,
    TextStyle? formInput,
    TextStyle? placeholder,
  }) {
    final standard = NebuxTypography.standard();
    return NebuxTypography(
      content: content ?? standard.content,
      paragraph: paragraph ?? standard.paragraph,
      caption: caption ?? standard.caption,
      heading: heading ?? standard.heading,
      section: section ?? standard.section,
      label: label ?? standard.label,
      primaryAction: primaryAction ?? standard.primaryAction,
      secondaryAction: secondaryAction ?? standard.secondaryAction,
      formInput: formInput ?? standard.formInput,
      placeholder: placeholder ?? standard.placeholder,
    );
  }

  /// Merges this typography scheme with another [NebuxTypography].
  ///
  /// Styles from [other] take precedence.
  NebuxTypography merge(NebuxTypography? other) {
    if (other == null) return this;
    return copyWith(
      content: other.content,
      paragraph: other.paragraph,
      caption: other.caption,
      heading: other.heading,
      section: other.section,
      label: other.label,
      primaryAction: other.primaryAction,
      secondaryAction: other.secondaryAction,
      formInput: other.formInput,
      placeholder: other.placeholder,
    );
  }
}
