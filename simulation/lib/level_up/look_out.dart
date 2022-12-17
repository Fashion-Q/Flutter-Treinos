import 'package:flutter/material.dart';
import 'package:simulation/level_up/look_controller.dart';
import 'package:simulation/level_up/level_up_screen.dart';

class Lookout extends StatefulWidget {
  const Lookout({super.key});

  @override
  State<Lookout> createState() {
    return Look();
  }
}

class Look extends State<Lookout> {
  late LookController controller;

  @override
  void initState() {
    super.initState();
    controller = LookController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => LevelUpScreen(
        controller: controller,
      ),
    );
  }
}
