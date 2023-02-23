import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../entidade/tarefa.dart';
import '../module/prioridade_look.dart';
import 'prioridade_controller.dart';

class ListaDeFormulario {
  List<Widget> listWidget = [];
  List<List<TextEditingController>> controller = [];
  TextEditingController x = TextEditingController();

  Widget escalonamentoX(Size size) {
    return Container(
      color: Colors.black12,
      width: size.width - 50,
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: Text(
              "Escalonamento X = ",
              textAlign: TextAlign.end,
              style: primaryStyle(size: 22),
            ),
          ),
          Container(
            width: 60,
            margin: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: x,
              maxLength: 5, // 100000
              decoration: const InputDecoration(
                  counterText: "", isCollapsed: true, border: InputBorder.none),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: tipoRestricao(2),
            ),
          ),
        ],
      ),
    );
  }

  void addForm(Size size) {
    listWidget.add(novoForm(size));
  }

  Widget getRow(
      int linha, int coluna, String nome, Size size, int restricao, bool aberto,
      {int? maxLenght}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: Text(
            nome,
            style: primaryStyle(size: 20),
            textAlign: TextAlign.end,
          ),
        ),
        Container(
          width: 60,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: TextField(
            controller: controller[linha][coluna],
            maxLength: maxLenght,
            enabled: aberto,
            decoration: const InputDecoration(
                counterText: "", isCollapsed: true, border: InputBorder.none),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: tipoRestricao(restricao),
          ),
        ),
      ],
    );
  }

  List<TextInputFormatter> tipoRestricao(int escolha) {
    if (escolha == 1) {
      return [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d{1,3}(\.\d{0,2})?$'),
          replacementString: '',
        ),
      ];
    } else {
      return [
        FilteringTextInputFormatter.digitsOnly,
      ];
    }
  }

  Widget novoForm(Size size) {
    List<Widget> rows = [];
    controller.add([]);
    controller[controller.length - 1] = List<TextEditingController>.generate(
        6, (index) => TextEditingController());
    rows.add(getRow(controller.length - 1, 0, "Período:", size, 1, true));
    rows.add(
        getRow(controller.length - 1, 1, "Tempo de execução:", size, 1, true));
    rows.add(getRow(controller.length - 1, 2, "Chegada:", size, 2, true,maxLenght: 2));
    rows.add(getRow(controller.length - 1, 3, "DeadLine:", size, 1, false));
    rows.add(getRow(controller.length - 1, 4, "Quantum:", size, 1, false));
    rows.add(getRow(controller.length - 1, 5, "Prioridade:", size, 2, true,
        maxLenght: 2));

    return Container(
      color: Colors.black12,
      width: size.width - 50,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: rows,
      ),
    );
  }

  //PrioridadeLook teste() {
  PrioridadeLook teste() {
    List<Task> tarefa = [];
    List<String> char = ["A"];
    int quant = listWidget.length;
    for (int i = 0; i < quant - 1; i++) {
      int nextChar = char[i].codeUnitAt(0) + 1;
      char.add(String.fromCharCode(nextChar));
    }

    List<double> periodo = [];
    for (int i = 0; i < quant; i++) {
      periodo.add(double.parse(controller[i][0].text));
    }
    for (int i = 0; i < char.length; i++) {
      tarefa.add(
        Task(
            nome: char[i],
            periodo: periodo[i],
            tempo: double.parse(controller[i][1].text),
            chegada: double.parse(controller[i][2].text),
            prioridade: int.parse(controller[i][5].text)),
      );
    }
    for (int i = 0; i < tarefa.length; i++) {
      debugPrint(tarefa[i].nome);
      debugPrint(tarefa[i].periodo.toStringAsFixed(2));
      debugPrint(tarefa[i].tempo.toStringAsFixed(2));
      debugPrint(tarefa[i].chegada.toStringAsFixed(2));
      debugPrint("Prioridade = ${tarefa[i].prioridade.toString()}");
    }
    PrioridadeController a =
        PrioridadeController(task: tarefa, x: double.parse(x.text));
    a.addTasks();

    PrioridadeLook p = PrioridadeLook(
      controller: a,
    );

    return p;
  }
}
