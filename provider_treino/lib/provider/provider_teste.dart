import 'package:flutter/material.dart';
import 'package:provider_treino/provider/button_soma.dart';
import 'package:provider_treino/provider/circular_progress.dart';
import 'package:provider_treino/provider/text_number.dart';

class ProviderTeste extends StatelessWidget {
  const ProviderTeste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Testando provider"),
          centerTitle: true,
          actions: const [ButtonSoma()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgress(),
              Text("Você pressionou o botão tantas vezes"),
              TextNumber(),
            ],
          ),
        ),
        floatingActionButton: const ButtonSoma());
  }
}
