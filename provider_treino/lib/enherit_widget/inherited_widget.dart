import 'package:flutter/material.dart';

class InheritedTreino extends InheritedWidget {
  InheritedTreino({super.key, required super.child});
  final List<int> cont = [2];

  final List<Padding> textos = [
    const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text("Texto 1"),
    )
  ];

  void novoTexto(String texto) {
    textos.add(Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text("Texto ${cont[0]}"),
    ));
    cont[0]++;
    debugPrint("${cont[0]}");
  }

  static InheritedTreino of(BuildContext context) {
    final InheritedTreino? result = maybeOf(context);
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  static InheritedTreino? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedTreino>();
  }

  @override
  bool updateShouldNotify(InheritedTreino oldWidget) {
    return cont[0] > oldWidget.cont[0];
  }
}
