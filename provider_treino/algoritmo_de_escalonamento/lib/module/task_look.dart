import 'package:algoritmo_de_escalonamento/controller/task_controller.dart';
import 'package:algoritmo_de_escalonamento/pages/task_page.dart';
import 'package:flutter/material.dart';

class TaskLook extends StatelessWidget {
  const TaskLook({super.key, required this.controller});
  final TaskController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => TaskPage(
        controller: controller,
      ),
    );
  }
}
