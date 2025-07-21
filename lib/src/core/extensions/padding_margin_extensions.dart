import 'package:flutter/material.dart';

extension PaddingExtensions on Widget {
  /// Add padding to all sides of the widget
  Widget paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// Add padding to the left and right sides of the widget
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Add padding to the top, left, right, and bottom sides of the widget
  Widget paddingOnly({
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

extension MarginExtensions on Widget {
  /// Add margin to all sides of the widget
  Widget marginAll(double margin) {
    return Container(margin: EdgeInsets.all(margin), child: this);
  }

  /// Add margin to the left and right sides of the widget
  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Add margin to the top, left, right, and bottom sides of the widget
  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Container(
    margin: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
    child: this,
  );

  /// Add margin to all sides of the widget
  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}
