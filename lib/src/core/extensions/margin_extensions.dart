import 'package:flutter/material.dart';

/// Convenience extensions on [Widget] for adding margin.
extension MarginExtensions on Widget {
  /// Add margin to all sides of the widget
  Widget marginAll(double margin) {
    return Container(margin: EdgeInsets.all(margin), child: this);
  }

  /// Add margin to the left side of the widget
  Widget marginLeft(double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      child: this,
    );
  }

  /// Add margin to the right side of the widget
  Widget marginRight(double margin) {
    return Container(
      margin: EdgeInsets.only(right: margin),
      child: this,
    );
  }

  /// Add margin to the top side of the widget
  Widget marginTop(double margin) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: this,
    );
  }

  /// Add margin to the bottom side of the widget
  Widget marginBottom(double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: this,
    );
  }

  /// Add margin to the left and right sides of the widget
  /// Add margin to the bottom side of the widget
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
