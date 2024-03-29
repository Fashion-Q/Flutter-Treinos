import 'package:flutter/material.dart';
import 'package:simulation/level_up/task.dart';

import '../repository/repository.dart';

class LookController extends ChangeNotifier {
  LookController({required this.repository});

  List<MyTask> levelUp = [];
  final Repository repository;

  void inicio() async {
    //https:picsum.photos/250?image=9
    //data:image/jpeg;base64,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
    //https:ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg
    //https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Shyvana_8.jpg
    int index = await repository.loadIndex("level");
    if (index == 0) {
      List<String> nomeFixo = [
        "Annie Kawaii *-*",
        "Ahri da Dinastia",
        "Shyvana Destruída"
      ];
      List<int> lvFixo = [1, 3, 8];
      List<String> urlFixo = [
        "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Annie_22.jpg",
        "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg",
        "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Shyvana_8.jpg"
      ];
      await repository.saveInt(0, "level");
      for (int i = 0; i < urlFixo.length; i++) {
        index++;

        await repository.saveJson({
          "id": index.toString(),
          "nome": nomeFixo[i],
          "level": lvFixo[i].toString(),
          "url": urlFixo[i],
          "progress": "0.0",
          "indexProgress": "0",
        }, "level$index");
      }
      await repository.saveInt(index, "level");
    }
  }

  void loadTarefas() async {
    levelUp.clear();
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 100));
    int qntTarefas = await repository.loadIndex("level");
    for (int i = 1; i <= qntTarefas; i++) {
      Map<String, dynamic> json = await repository.loadJson("level$i");
      if (int.parse(json["id"] ?? "-1") == -1) continue;

      levelUp.add(MyTask(
        loadTarefas: loadTarefas,
        repository: repository,
        id: int.parse(json["id"].toString()),
        nome: json["nome"],
        lv: int.parse(json["level"].toString()),
        url: json["url"],
        progress: double.parse(json["progress"].toString()),
        indexProgress: int.parse(json["indexProgress"].toString()),
      ));
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void deletarTarefas() async {
    levelUp.clear();
    int qntTarefas = await repository.loadIndex("level");
    for (int i = 1; i <= qntTarefas; i++) {
      await repository.remove("level$i");
    }
    await repository.saveInt(0, "level");
    notifyListeners();
    Future.delayed(const Duration(microseconds: 100));
  }
}
