import 'package:flutter/material.dart';
import 'package:castle_way/ui/controller.dart';
import 'package:castle_way/ui/player_interface.dart';

class ModulePlayerUi extends StatelessWidget {
  const ModulePlayerUi({super.key, required this.controller});
  final PlayerUiControler controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (build, child) => PlayerUi(
        controller: controller,
      ),
    );
  }
}
