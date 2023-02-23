import 'dart:core';
import 'package:algoritmo_de_escalonamento/controller/task_controller.dart';
import 'package:algoritmo_de_escalonamento/module/task_look.dart';
import 'package:algoritmo_de_escalonamento/share/box_decoration.dart';
import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';
import '../entidade/tarefa.dart';

class PrioridadeController extends ChangeNotifier {
  final List<Task> task;
  List<Map<String, dynamic>> jsonTodasTarefas = [];
  final List<TaskController> taskController = [];
  final List<TaskLook> taskLook = [];
  final List<Widget> infoTable = [];
  final List<Widget> widgetsTableChegada = [];
  final List<List<double>> infoChegada = [];
  final List<Widget> columnRowEscalonamento = [];
  int indexInfoChegada = 0;
  double escalonamentoX = 0.00;
  bool playButton = false;
  bool reset = false;
  int timeAnimacao = 100;

  TaskLook? taskEmExecucao;
  final List<String> info = [
    "Tarefa(s)",
    "Período",
    "Tempo",
    "Chegada",
    "Prioridade"
  ];
  final double x;

  PrioridadeController({required this.task, required this.x});

  void addTasks() {
    for (int i = 0; i < task.length; i++) {
      if (task[i].chegada == 0) {
        taskController.add(
          TaskController(task: task[i]),
        );
        taskLook.add(
          TaskLook(controller: taskController[taskController.length - 1]),
        );
        indexInfoChegada = 1;
      }
    }
    taskEmExecucao = proximaExecucao();

    for (int i = 0; i < task.length; i++) {
      jsonTodasTarefas.add(task[i].toJason());
    }
    for (int i = 0; i < info.length; i++) {
      List<Widget> text = [];
      text.add(
        Text(
          info[i],
          style: primaryStyle(size: 22),
        ),
      );
      for (int j = 0; j < task.length; j++) {
        text.add(
          Text(
            formatName(info[i], jsonTodasTarefas[j][info[i]]),
            style: primaryStyle(size: 20),
          ),
        );
      }
      infoTable.add(
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: text,
          ),
        ),
      );
    }
    widgetsTableChegada.add(addFirstTableTempoChegadaX());
    List<double> auxChegada = [];
    for (int i = 0; i < task.length; i++) {
      auxChegada.add(task[i].chegada);
    }

    for (double i = 0; i < x;) {
      bool achou = false;
      int index = 0;
      for (int j = 0; j < auxChegada.length; j++) {
        if (auxChegada[j] == i) {
          achou = true;
          index = j;
          break;
        }
      }
      if (achou) {
        double fixWidth = fixWidthWidgetsTableChegada(auxChegada[index]);
        List<Widget> columnChegada = [];
        List<double> copyList = [];
        for (int k = 0; k < auxChegada.length; k++) {
          if (auxChegada[k] == i) {
            columnChegada.add(
              addChegada(auxChegada[k].toStringAsFixed(2), fixWidth),
            );
            copyList.add(auxChegada[k]);
            auxChegada[k] = double.parse(
                ((auxChegada[k] + task[k].periodo)).toStringAsFixed(2));
          } else {
            //lambd
            columnChegada.add(
              addChegada("λ", fixWidth),
            );
            copyList.add(-1);
          }
        }
        infoChegada.add(List.from(copyList));
        widgetsTableChegada.add(Column(
          children: columnChegada,
        ));
      }
      i = i + 0.01;
      i = double.parse(i.toStringAsFixed(2));
    }
    columnRowEscalonamento.add(
      taskEmExecucao == null
          ? addColumnRowEscalonamento("0", "λ")
          : addColumnRowEscalonamento("0",
              "${taskEmExecucao!.controller.nome}${taskEmExecucao!.controller.chegada}"),
    );
  }

  Widget addColumnRowEscalonamento(String chegada, String nome) {
    List<Text> text = [];
    text.add(
      Text(
        nome,
        style: primaryStyle(size: 16),
      ),
    );
    text.add(
      Text(
        "$chegada-------------",
        style: primaryStyle(size: 16),
      ),
    );
    return Column(
      children: text,
    );
  }

  Widget addChegada(String nome, double fixWidth) {
    return boxDecorationTableTempoChegadaX(
      width: fixWidth,
      child: Text(
        nome,
        style: primaryStyle(
          size: 22,
        ),
      ),
    );
  }

  double fixWidthWidgetsTableChegada(double number) {
    double fixWidth = 1;
    while (number >= 10) {
      fixWidth++;
      number = double.parse((number / 10).toStringAsFixed(0));
    }
    return double.parse((34 + fixWidth * 17).toStringAsFixed(0));
  }

  Widget addFirstTableTempoChegadaX() {
    List<Widget> firstColumnChegada = [];
    for (int i = 0; i < task.length; i++) {
      firstColumnChegada.add(
        boxDecorationTableTempoChegadaX(
          width: 50,
          child: Text(
            task[i].nome,
            style: primaryStyle(size: 22),
          ),
        ),
      );
    }
    return Column(
      children: firstColumnChegada,
    );
  }

  Widget widgetTaskEmExecucao() {
    return taskEmExecucao ??
        Container(
          alignment: Alignment.center,
          width: 50,
          color: Colors.green,
          child: Text(
            "λ",
            style: primaryStyle(size: 25),
          ),
        );
  }

  String formatName(String chave, dynamic valor) {
    return chave == "Tarefa(s)" || chave == "Prioridade"
        ? valor.toString()
        : valor.toStringAsFixed(2);
  }

  double fixHeightInfoTable() {
    double fixHeight = task.length * 28 + 30;
    return fixHeight;
  }

  double fixHeightTableChegada() {
    double fixHeight = task.length * 31;
    return fixHeight;
  }

  void increment() {
    escalonamentoX = double.parse((escalonamentoX + 0.01).toStringAsFixed(2));
    bool proximaExec = false;
    if (taskEmExecucao != null && taskEmExecucao!.controller.task.noZero) {
      taskEmExecucao!.controller.incrementNotifier();
      if (!taskEmExecucao!.controller.task.noZero) {
        taskEmExecucao = null;
        taskEmExecucao = proximaExecucao();
        proximaExec = true;
      }
    }
    if (infoChegada.isNotEmpty && indexInfoChegada < infoChegada.length) {
      bool chegouAlguem = false;
      for (int i = 0; i < infoChegada[indexInfoChegada].length; i++) {
        if (infoChegada[indexInfoChegada][i] == escalonamentoX) {
          taskController.add(
            TaskController(
              task: task[i].copyWith(
                  novoNome: task[i].nome,
                  novoChegada: infoChegada[indexInfoChegada][i],
                  prioridade: task[i].prioridade,
                  novoTempo: jsonTodasTarefas[i]["Tempo"]),
            ),
          );
          taskLook.add(
            TaskLook(
              controller: taskController[taskController.length - 1],
            ),
          );
          chegouAlguem = true;
        }
      }
      if (chegouAlguem) {
        TaskLook? taskAnterior = taskEmExecucao;
        taskEmExecucao = proximaExecucao();
        if (taskAnterior != taskEmExecucao && taskEmExecucao != null) {
          columnRowEscalonamento.add(addColumnRowEscalonamento(
              escalonamentoX.toStringAsFixed(2),
              "${taskEmExecucao!.controller.nome}${taskEmExecucao!.controller.chegada}"));
        }
        indexInfoChegada++;
      } else if (proximaExec) {
        if (taskEmExecucao != null) {
          columnRowEscalonamento.add(addColumnRowEscalonamento(
              escalonamentoX.toStringAsFixed(2),
              "${taskEmExecucao!.controller.nome}${taskEmExecucao!.controller.chegada}"));
        } else {
          columnRowEscalonamento.add(addColumnRowEscalonamento(
              escalonamentoX.toStringAsFixed(2), "λ"));
        }
      }
    }
    notifyListeners();
  }

  TaskLook? proximaExecucao() {
    if (taskLook.isEmpty) {
      return null;
    }
    int prioridade = taskEmExecucao == null
        ? 9223372036854775
        : taskEmExecucao!.controller.prioridade!; //780
    int index = -1;
    for (int i = 0; i < taskLook.length; i++) {
      if (taskLook[i].controller.noZero &&
          prioridade > taskLook[i].controller.prioridade!) {
        prioridade = taskLook[i].controller.prioridade!;
        index = i;
      }
    }
    if (prioridade != 9223372036854775) {
      return index > -1 ? taskLook[index] : taskEmExecucao;
    }
    return null;
  }

  void playOrPauseButton() async {
    if (escalonamentoX < x) {
      playButton = !playButton;
      notifyListeners();
      if (playButton) {
        while (playButton && escalonamentoX < x) {
          increment();
          await Future.delayed(Duration(milliseconds: timeAnimacao));
        }
        if (escalonamentoX == x) {
          playButton = false;
          reset = true;
          notifyListeners();
        }
      }
    }
  }

  void tempoAnimacaoDescrementa() {
    if (timeAnimacao > 0) {
      if (timeAnimacao == 10) {
        timeAnimacao += 2;
      }
      timeAnimacao -= 10;
      if (timeAnimacao < 0) {
        timeAnimacao = 0;
      }
      notifyListeners();
    }
  }

  void tempoAnimacaoIncrementa() {
    if (timeAnimacao < 500) {
      if (timeAnimacao == 2) {
        timeAnimacao = 10;
      }else{
        timeAnimacao += 10;
      }
      notifyListeners();
    }
  }

  void justNotifier() {
    notifyListeners();
  }

  void resetarTudo() async {
    reset = false;
    notifyListeners();
    for (int i = 0; i < task.length; i++) {
      task[i].tempo = jsonTodasTarefas[i][info[2]];
      task[i].noZero = true;
    }
    jsonTodasTarefas.clear();
    taskController.clear();
    taskLook.clear();
    infoTable.clear();
    widgetsTableChegada.clear();
    infoChegada.clear();
    columnRowEscalonamento.clear();
    taskEmExecucao = null;
    indexInfoChegada = 0;
    playButton = false;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    addTasks();
    escalonamentoX = 0.00;
    notifyListeners();
  }
}
