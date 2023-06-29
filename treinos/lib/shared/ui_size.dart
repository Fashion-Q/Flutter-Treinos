import 'package:flutter/material.dart';

extension UiSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get shortestSize => MediaQuery.of(this).size.shortestSide;
  double get logestSize => MediaQuery.of(this).size.longestSide;

  double percentW(double percent) => width * percent;
  double percentH(double percent) => height * percent;
}