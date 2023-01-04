import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_treino/components/button_soma.dart';
import 'controller.dart';

class ProviderTeste extends StatefulWidget {
  const ProviderTeste({super.key});

  @override
  State<ProviderTeste> createState() {
    return MyProvider();
  }
}

class MyProvider extends State<ProviderTeste> {
  @override
  Widget build(BuildContext context) {
    final Controller controller = context.watch<Controller>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Testando provider"),
          centerTitle: true,
          actions: const [
            ButtonSoma()
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: controller.estado == Estado.loading ,
                child: const CircularProgressIndicator(),
              ),
              const Text("Você pressionou o botão tantas vezes"),
              Text(
                "${controller.contador}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton:  const ButtonSoma()
    );
  }
}
