import 'package:flutter/material.dart';

mixin HelperWidget<T extends ChangeNotifier> on ChangeNotifier {
  Widget favoritIcon(double opacity) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Icon(
        Icons.favorite,
        color: Colors.red.withOpacity(opacity),
        size: 30,
      ),
    );
  }
}

double tiledSize = 16;
