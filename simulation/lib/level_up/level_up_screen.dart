import 'package:flutter/material.dart';
import 'package:simulation/level_up/look_controller.dart';

class LevelUpScreen extends StatelessWidget {
  const LevelUpScreen({super.key, required this.controller});

  final LookController controller;

  @override
  Widget build(BuildContext context) {
    controller.setSize(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level up"),
        centerTitle: true,
      ),
      body: Column(children: controller.task.levelUp),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          controller.inicio();
        },
        child: const Text("Adicionar uma nova tarefa!"),
      ),
    );
  }
}
