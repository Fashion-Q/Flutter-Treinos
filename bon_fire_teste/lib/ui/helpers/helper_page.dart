import 'package:bon_fire_teste/ui/helpers/helper_size.dart';
import 'package:bon_fire_teste/ui/helpers/loader.dart';
import 'package:bon_fire_teste/ui/helpers/messages.dart';
import 'package:flutter/material.dart';

class MyHelperWidget extends StatefulWidget {
  const MyHelperWidget({super.key});

  @override
  State<MyHelperWidget> createState() => _MyHelperWidgetState();
}

class _MyHelperWidgetState extends State<MyHelperWidget>
    with HelpLoader, HelpderMessages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Testando a página"), centerTitle: true),
      body: SizedBox(
          width: context.percentW(1),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "teste",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    showLoader();
                    await Future.delayed(
                      const Duration(seconds: 2),
                    );
                    hideLoader();
                  },
                  child: const Text("Botao 1"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    showError("Erro testando");
                    showWarning("Warnings");
                    showInfo("Show Info");
                    showSucess("Sucesso!");
                  },
                  child: const Text("Botao 2"),
                ),
              ),
            ],
          )),
    );
  }
}
