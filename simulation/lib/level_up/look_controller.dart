import 'package:flutter/material.dart';
import 'package:simulation/level_up/make_task.dart';

class LookController extends ChangeNotifier {
  final MakeTask task = MakeTask();

  void setSize(Size size) {
    task.setSize(size);
  }

  void inicio() {
    task.addTask("queijo", 5, "ralado");
    notifyListeners();
  }
}
