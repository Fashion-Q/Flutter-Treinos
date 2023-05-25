import 'package:flutter/material.dart';

extension UiSize on BuildContext{
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
  double get shortestSize => MediaQuery.of(this).size.shortestSide;
  double get logestSize => MediaQuery.of(this).size.longestSide;

  double percentW(double percent) => w * percent;
  double percentH(double percent) => h * percent;
  double percentS(double percent) => shortestSize * percent;

}

class TestandoPath{

}