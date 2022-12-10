import 'package:flutter/material.dart';
import 'package:produto/postar_produto/componentes.dart';
import 'package:produto/postar_produto/repositorio.dart';

class PostarProduto extends StatefulWidget {
  const PostarProduto({super.key});

  @override
  State<PostarProduto> createState() => _Postar();
}

class _Postar extends State<PostarProduto> {
  final Repositorio rep = Repositorio();
  final Componentes comp = Componentes();
  final TextEditingController idFixo = TextEditingController(text: "101");
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  int n = 0;
  String snackBar = "";
  bool loadingProgress = false;

  @override
  void dispose() {
    idFixo.dispose();
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Postar produtos!"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Preencha os campos abaixo!"),
            ),
            Visibility(
              visible: loadingProgress,
              child: const CircularProgressIndicator(
                color: Color.fromARGB(255, 54, 244, 117),
                strokeWidth: 7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("id: "),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: idFixo,
                    textAlign: TextAlign.center,
                    decoration: comp.getTextFieldDecorationForm(false),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("titulo: "),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: title,
                      textAlign: TextAlign.center,
                      decoration: comp.getTextFieldDecorationForm(true),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("description: "),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: description,
                      textAlign: TextAlign.center,
                      decoration: comp.getTextFieldDecorationForm(true),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loadingProgress = true;
                  });
                      snackBar = await rep.enviar(
                      idFixo.text, title.text, description.text)
                      ? "Enviado com sucesso!"
                      : "Não foi enviado D:";
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(snackBar),
                    ),
                  );
                  setState(() {
                    loadingProgress = false;
                  });
                },
                child: const Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
