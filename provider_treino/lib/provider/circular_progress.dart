import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = context.watch<Controller>();
    return Visibility(
      visible: controller.estado == Estado.loading,
      child: const CircularProgressIndicator(),
    );
  }
}
