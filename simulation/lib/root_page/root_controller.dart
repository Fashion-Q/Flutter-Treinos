import 'package:flutter/material.dart';
import 'package:simulation/root_page/root_components.dart';

class RootController extends ChangeNotifier {
  bool boolDarkTheme = false;

  static RootController controller = RootController();
  final RootComponentes comp = RootComponentes();

  void changeTheme() {
    boolDarkTheme = !boolDarkTheme;
    notifyListeners();
  }
}
