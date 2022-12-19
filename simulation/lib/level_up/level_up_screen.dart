import 'package:flutter/material.dart';
import 'package:simulation/level_up/look_controller.dart';

class LevelUpScreen extends StatelessWidget {
  const LevelUpScreen({super.key, required this.controller});

  final LookController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: controller.levelUp,
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, "addTask");
        },
        child: const Text("Adicionar uma nova tarefa!"),
      ),
    );
  }
}
