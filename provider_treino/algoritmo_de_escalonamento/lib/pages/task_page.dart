import 'package:algoritmo_de_escalonamento/controller/task_controller.dart';
import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.controller});
  final TaskController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        color: controller.task.noZero ? Colors.green : Colors.red,
        width: 80 + controller.fixWidth(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.task.nome}${controller.task.chegada.toStringAsFixed(2)}",
              style: primaryStyle(size: 22),
            ),
            Text(
              controller.task.tempo.toStringAsFixed(2),
              style: primaryStyle(size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
