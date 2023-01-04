import 'package:flutter/material.dart';

enum Estado { start, sucesso, error, loading }

class Controller extends ChangeNotifier {
  int contador = 0;
  Estado estado = Estado.start;

  void teste() async {
    debugPrint("Queijo $contador");
    estado = Estado.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2),(){
      contador++;
      estado = Estado.start;
      notifyListeners();
    });
  }
}
