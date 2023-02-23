import 'package:algoritmo_de_escalonamento/module/prioridade_look.dart';
import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';

class EscalonamentoPrioridade extends StatelessWidget {
  const EscalonamentoPrioridade({super.key, required this.prioridade});
  final PrioridadeLook prioridade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Algoritmo de Escalonamento",
          style: primaryStyle(size: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            prioridade,
          ],
        ),
      ),
    );
  }
}
