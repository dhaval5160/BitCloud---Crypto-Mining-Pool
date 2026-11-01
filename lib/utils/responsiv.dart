import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final Size screenSize;
  final double _width;
  final double _height;
  final double _blockWidth;
  final double _blockHeight;

  Responsive(this.context)
    : screenSize = MediaQuery.of(context).size,
      _width = MediaQuery.of(context).size.width,
      _height = MediaQuery.of(context).size.height,
      _blockWidth = MediaQuery.of(context).size.width / 100,
      _blockHeight = MediaQuery.of(context).size.height / 100;

  /// Screen width in pixels
  double get screenWidth => _width;

  /// Screen height in pixels
  double get screenHeight => _height;

  /// Returns width as percentage of screen width
  double widthPercent(double percent) => _blockWidth * percent;

  /// Returns height as percentage of screen height
  double heightPercent(double percent) => _blockHeight * percent;

  /// Responsive text size based on screen width
  double textSize(double percent) => _blockWidth * percent;

  /// Safe area padding for bottom
  double get safeAreaBottom => MediaQuery.of(context).padding.bottom;

  /// Safe area padding for top
  double get safeAreaTop => MediaQuery.of(context).padding.top;
}

extension ResponsiveExt on BuildContext {
  Responsive get responsive => Responsive(this);
}
