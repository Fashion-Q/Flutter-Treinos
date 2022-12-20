import 'package:flutter/material.dart';
import 'package:simulation/level_up/model_task.dart';
import 'package:simulation/level_up/task.dart';

import '../repository/repository.dart';

class LookController extends ChangeNotifier {
  LookController({required this.repository});

  List<MyTask> levelUp = [];
  final Repository repository;

  void inicio() {
    //https://picsum.photos/250?image=9
    //https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg
    // levelUp.add(const MyTask(
    //     nome: "Ahri Kawaii desu",
    //     lv: 1,
    //     url:
    //         "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg"));
    // notifyListeners();
  }

  void loadTarefas() async {
    //deletTask();
    levelUp.clear();
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 100));
    int qntTarefas = await repository.loadIndex("level");
    for (int i = 1; i <= qntTarefas; i++) {
      Map<String, dynamic> json =
          ModelTask.fromJson(await repository.loadJson("level$i")).toJson();
      levelUp.add(MyTask(
        nome: json["nome"],
        lv: json["level"],
        url: json["url"],
        progress: json["progress"],
        indexProgress: json["indexProgress"],
      ));
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  void saveTask() async {
    levelUp[0].progress;
  }

  void deletTask() async {
    int qntTarefas = await repository.loadIndex("level");
    for (int i = 1; i <= qntTarefas; i++) {
      await repository.remove("level$i");
    }
    print("foi deletado");
    await repository.saveInt(0, "level");
    print(await repository.loadIndex("level"));
    notifyListeners();
  }
}
