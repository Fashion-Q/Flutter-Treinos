import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = context.watch<Controller>();
    return Text(
      "${controller.contador}",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
