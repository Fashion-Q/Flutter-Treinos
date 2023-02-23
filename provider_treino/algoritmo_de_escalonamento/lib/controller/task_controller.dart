import 'package:algoritmo_de_escalonamento/entidade/tarefa.dart';
import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  Task task;
  TaskController({required this.task});

  void incrementNotifier() {
    task.tempo = double.parse((task.tempo - 0.01).toStringAsFixed(2));
    if (task.tempo <= 0) {
      task.tempo = 0;
      task.noZero = false;
    }
    notifyListeners();
  }

  void justNotifier() {
    notifyListeners();
  }

  double fixWidth() {
    double fixWidht = 0;
    for (int i = 10;
        i <= double.parse(task.tempo.toString());
        i *= 10, fixWidht += 11) {}
    return fixWidht;
  }

  String get nome => task.nome;
  String get periodo => task.periodo.toStringAsFixed(2);
  String get tempo => task.tempo.toStringAsFixed(2);
  int? get prioridade => task.prioridade;
  bool get noZero => task.noZero;
  String get chegada => task.chegada.toStringAsFixed(2);
}
