import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'repositorio.dart';
import 'componentes.dart';

class DeletarProduto extends StatefulWidget {
  const DeletarProduto({super.key});

  @override
  State<DeletarProduto> createState() => _Deletar();
}

class _Deletar extends State<DeletarProduto> {
  final Repositorio rep = Repositorio();
  final Componentes comp = Componentes();
  int n = 0;
  String snackBar = "";
  bool loadingProgress = false;
  bool clickButton = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delet product"),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("\nDigite o numero do produto a ser deletado  "),
                  SizedBox(
                      width: 65,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (valor) {
                          n = valor.isNotEmpty ? int.parse(valor) : 0;
                        },
                        autofocus: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 3,
                        decoration: comp.getTextFieldDecoration(),
                      )),
                ],
              ),
            ),
            Visibility(
              visible: loadingProgress,
              child: const CircularProgressIndicator(
                color: Color.fromARGB(255, 54, 244, 117),
                strokeWidth: 7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (clickButton) {
                    clickButton = false;
                    setState(() {
                      loadingProgress = true;
                    });
                    snackBar = await rep.deletar(n)
                        ? "Deletado com sucesso!"
                        : "Não foi deletado D:";

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(snackBar),
                      ),
                    );
                    setState(() {
                      loadingProgress = false;
                    });
                    Future.delayed(const Duration(milliseconds: 5000), () {
                      clickButton = true;
                    });
                  }
                },
                child: const Text("Deletar"),
              ),
            ),
            Visibility(
              visible: rep.deletado,
              child: Text("id: ${rep.model?.id ?? 0}"),
            ),
            Visibility(
              visible: rep.deletado,
              child: Text("Titulo: ${rep.model?.title ?? 'queijo'}"),
            ),
            Visibility(
              visible: rep.deletado,
              child: Text("Price: ${rep.model?.price ?? 'queijo'}"),
            ),
            Visibility(
              visible: rep.deletado,
              child: Text("Deleted on: ${rep.data}"),
            ),
          ],
        ),
      ),
    );
  }
}
