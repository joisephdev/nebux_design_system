import 'package:freezed_annotation/freezed_annotation.dart';

part 'nebux_font_size.freezed.dart';
part 'nebux_font_size.g.dart';

/// NebuX Core Font Size System
///
/// Defines font sizes for the NebuX Core design system using Freezed.
@Freezed(fromJson: true, toJson: true)
abstract class NebuxFontSize with _$NebuxFontSize {
  /// Creates a [NebuxFontSize] instance.
  const factory NebuxFontSize({
    /// Extra small font size (8px)
    required double extraSmall,

    /// Small font size (10px)
    required double small,

    /// Medium font size (12px)
    required double medium,

    /// Medium large font size (13px)
    required double mediumLarge,

    /// Large font size (14px)
    required double large,

    /// Extra large font size (16px)
    required double extraLarge,

    /// Heading 4 font size (18px)
    required double heading4,

    /// Heading 3 font size (20px)
    required double heading3,

    /// Heading 2 font size (22px)
    required double heading2,

    /// Heading 1 font size (24px)
    required double heading1,

    /// Display 3 font size (28px)
    required double display3,

    /// Display 2 font size (32px)
    required double display2,

    /// Display 1 font size (36px)
    required double display1,
  }) = _NebuxFontSize;

  const NebuxFontSize._();

  /// Creates a standard set of font sizes for the NebuX design system.
  factory NebuxFontSize.standard() => const NebuxFontSize(
    extraSmall: 8.0,
    small: 10.0,
    medium: 12.0,
    mediumLarge: 13.0,
    large: 14.0,
    extraLarge: 16.0,
    heading4: 18.0,
    heading3: 20.0,
    heading2: 22.0,
    heading1: 24.0,
    display3: 28.0,
    display2: 32.0,
    display1: 36.0,
  );

  /// Creates a custom set of font sizes with optional overrides.
  factory NebuxFontSize.custom({
    double? extraSmall,
    double? small,
    double? medium,
    double? mediumLarge,
    double? large,
    double? extraLarge,
    double? heading4,
    double? heading3,
    double? heading2,
    double? heading1,
    double? display3,
    double? display2,
    double? display1,
  }) {
    final standard = NebuxFontSize.standard();
    return standard.copyWith(
      extraSmall: extraSmall ?? standard.extraSmall,
      small: small ?? standard.small,
      medium: medium ?? standard.medium,
      mediumLarge: mediumLarge ?? standard.mediumLarge,
      large: large ?? standard.large,
      extraLarge: extraLarge ?? standard.extraLarge,
      heading4: heading4 ?? standard.heading4,
      heading3: heading3 ?? standard.heading3,
      heading2: heading2 ?? standard.heading2,
      heading1: heading1 ?? standard.heading1,
      display3: display3 ?? standard.display3,
      display2: display2 ?? standard.display2,
      display1: display1 ?? standard.display1,
    );
  }

  /// Merges this font size scheme with another [NebuxFontSize].
  ///
  /// Sizes from [other] take precedence.
  NebuxFontSize merge(NebuxFontSize? other) {
    if (other == null) return this;
    return copyWith(
      extraSmall: other.extraSmall,
      small: other.small,
      medium: other.medium,
      mediumLarge: other.mediumLarge,
      large: other.large,
      extraLarge: other.extraLarge,
      heading4: other.heading4,
      heading3: other.heading3,
      heading2: other.heading2,
      heading1: other.heading1,
      display3: other.display3,
      display2: other.display2,
      display1: other.display1,
    );
  }
}
