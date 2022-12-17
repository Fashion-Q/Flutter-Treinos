import 'package:flutter/material.dart';
import 'package:simulation/level_up/model.task.dart';

class MakeTask {
  List<Widget> levelUp = [];
  Size? size;

  bool addTask(String nome, int lv, String url) {
    levelUp.add(ModelTask(nome: nome, lv: lv, url: url));
    return true;
  }

  void setSize(Size size) {
    this.size = size;
  }
}
