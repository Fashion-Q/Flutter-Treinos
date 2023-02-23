import 'package:algoritmo_de_escalonamento/controller/formulario.dart';
import 'package:algoritmo_de_escalonamento/module/prioridade_look.dart';
import 'package:algoritmo_de_escalonamento/pages/prioridade_screen.dart';
import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});
  @override
  State<FormularioPage> createState() => Formulario();
}

class Formulario extends State<FormularioPage> {
  final ListaDeFormulario form = ListaDeFormulario();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < form.controller.length; i++) {
      for (int j = 0;
          j < form.controller[form.controller[i].length].length;
          j++) {
        form.controller[i][j].dispose();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Algoritmo de Escalonamento",
          style: primaryStyle(size: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
          color: Colors.black12,
          child: Column(
            children: [
              SizedBox(
                  width: size.width - 50,
                  child: Text(
                    "Período e Tempo de execução precisam ser >= 0.1. \nEscalonamento X precisa ser >= 10\nTamanho de tarefas precisam ser >=2",
                    style: primaryStyle(size: 22),
                  )),
              Column(
                children: form.listWidget,
              ),
              form.escalonamentoX(size),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (form.listWidget.isNotEmpty) {
                          form.listWidget.removeAt(form.listWidget.length - 1);
                          form.controller.removeAt(form.controller.length - 1);
                          setState(() {});
                        }
                      },
                      child: const Text("-"),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        form.addForm(size);
                        setState(() {});
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    bool boo = true;
                    for (int i = 0; i < form.controller.length; i++) {
                      for (int j = 0; j < form.controller[i].length; j++) {
                        if (form.controller[i][j].text.isEmpty &&
                            j != 3 &&
                            j != 4) {
                          boo = false;
                          i = form.controller.length - 1;
                          j = 10;
                        } else if ((j == 0 || j == 1) &&
                            double.parse(form.controller[i][j].text) <= 0.09) {
                          boo = false;
                          i = form.controller.length - 1;
                          debugPrint("Aq $j");
                          j = 10;
                        }
                      }
                    }
                    if (form.x.text.isEmpty ||
                        double.parse(form.x.text) < 10 ||
                        form.listWidget.length < 2) {
                      debugPrint("X");
                      boo = false;
                    }
                    debugPrint("Boo = $boo");
                    if (boo) {
                      //form.teste();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EscalonamentoPrioridade(prioridade: form.teste(),)));
                    }
                  },
                  child: Text(
                    "Algoritmo de Prioridade",
                    style: primaryStyle(size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
