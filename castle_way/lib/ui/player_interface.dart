import 'package:flutter/material.dart';
import 'package:castle_way/ui/controller.dart';

class PlayerUi extends StatelessWidget {
  const PlayerUi({super.key, required this.controller});
  final PlayerUiControler controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Container(
        color: Colors.green.withOpacity(0.3),
        width: 300,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
              child: Image.asset('assets/images/player/idle/m_interface.png'),
            ),
            ...controller.life,
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ElevatedButton(
                onPressed: controller.teste,
                child: const Text("Teste"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
