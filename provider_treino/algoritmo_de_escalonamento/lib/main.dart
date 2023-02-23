import 'package:algoritmo_de_escalonamento/controller/prioridade_controller.dart';
import 'package:algoritmo_de_escalonamento/module/prioridade_look.dart';
import 'package:algoritmo_de_escalonamento/pages/formulario_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'entidade/tarefa.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const Root(),
    ),
  );
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "Algoritmo de Escalonamento",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormularioPage(),
      // home: EscalonamentoPrioridade(
      //   prioridade: teste(),
      // ),
    );
  }
}

PrioridadeLook teste() {
  List<Task> tarefa = [];
  List<String> char = ["A"];
  int quant = 5;
  for (int i = 0; i < quant; i++) {
    int nextChar = char[i].codeUnitAt(0) + 1;
    char.add(String.fromCharCode(nextChar));
  }

  List<double> periodo = [];
  for (int i = 1; i <= quant + 1; i++) {
    periodo.add((i.toDouble()/2));
  }
  for (int i = 0; i < char.length; i++) {
    tarefa.add(
      Task(
          nome: char[i],
          periodo: periodo[i],
          tempo: 0.25,
          chegada: i == 0 ? 0.10 : 0,
          prioridade: 0),
    );
  }
  PrioridadeController a = PrioridadeController(task: tarefa, x: 5);
  a.addTasks();

  PrioridadeLook p = PrioridadeLook(
    controller: a,
  );

  return p;
}
