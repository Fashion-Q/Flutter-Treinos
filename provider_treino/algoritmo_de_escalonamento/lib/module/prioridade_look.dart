import 'package:algoritmo_de_escalonamento/controller/prioridade_controller.dart';
import 'package:algoritmo_de_escalonamento/pages/prio_page.dart';
import 'package:flutter/material.dart';

class PrioridadeLook extends StatelessWidget {
  const PrioridadeLook({super.key, required this.controller});
  final PrioridadeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Prioridade(controller: controller),
    );
  }
}
