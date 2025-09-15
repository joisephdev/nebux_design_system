import 'package:flutter/material.dart';

extension PaddingExtensions on Widget {
  /// Add padding to all sides of the widget
  /* Widget nbxPaddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  } */

  /// Add padding to the left side of the widget
  Widget nbxPaddingLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  /// Add padding to the right side of the widget
  Widget nbxPaddingRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  /// Add padding to the top side of the widget
  Widget nbxPaddingTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  /// Add padding to the bottom side of the widget
  Widget nbxPaddingBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  /// Add padding to the left and right sides of the widget
  Widget nbxPaddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Add padding to the left and right sides of the widget
  Widget nbxPaddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  /// Add padding to the top and bottom sides of the widget
  Widget nbxPaddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  /// Add padding to the top, left, right, and bottom sides of the widget
  Widget nbxPaddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  /// Add padding to all sides of the widget
  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}
