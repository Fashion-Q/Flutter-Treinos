import 'package:flutter/material.dart';
import 'package:simulation/level_up/task.dart';

class LookController extends ChangeNotifier {
  List<Widget> levelUp = [];

  void inicio() {
    levelUp.add(const MyTask(
        nome: "Ahri Kawaii desu",
        lv: 1,
        url:
            "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg"));
    notifyListeners();
  }
}
