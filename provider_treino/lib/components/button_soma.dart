import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/controller.dart';

class ButtonSoma extends StatelessWidget {
  const ButtonSoma({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = context.watch<Controller>();
    return IconButton(
      onPressed: controller.estado == Estado.start ? controller.teste : null,
      icon: const Icon(Icons.favorite),
    );
  }
}
