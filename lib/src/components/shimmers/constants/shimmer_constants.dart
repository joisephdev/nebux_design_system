import 'package:flutter/material.dart';

/// Contains all shimmer-related constants and configurations.
class ShimmerConstants {
  /// Default shimmer gradient configuration for skeleton animations.
  ///
  /// @returns: Linear gradient configuration for shimmer effect [LinearGradient].
  static const LinearGradient defaultGradient = LinearGradient(
    colors: [
      Color.fromARGB(0, 255, 255, 255),
      Color.fromARGB(40, 255, 255, 255),
      Color.fromARGB(82, 255, 255, 255),
      Color.fromARGB(40, 255, 255, 255),
      Color.fromARGB(0, 255, 255, 255),
    ],
    stops: [0.0, 0.3, 0.5, 0.7, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.decal,
  );

  /// Default spacing between shimmer elements.
  ///
  /// @returns: Default spacing value [double].
  static const double defaultSpacing = 10.0;

  /// Default border radius for shimmer containers.
  ///
  /// @returns: Default border radius value [double].
  static const double defaultBorderRadius = 8.0;

  /// Default shadow configuration for shimmer containers.
  ///
  /// @returns: List of box shadows [List<BoxShadow>].
  static List<BoxShadow> get defaultShadow => [
    BoxShadow(
      spreadRadius: 0.5,
      blurRadius: 0.5,
      color: Colors.grey.withAlpha(25),
    ),
  ];

  /// Default container padding for shimmer elements.
  ///
  /// @returns: Default padding configuration [EdgeInsets].
  static const EdgeInsets defaultPadding = EdgeInsets.all(8.0);

  /// Default horizontal padding for shimmer lists.
  ///
  /// @returns: Default horizontal padding [EdgeInsets].
  static const EdgeInsets defaultHorizontalPadding = EdgeInsets.symmetric(
    horizontal: 16,
  );
}
