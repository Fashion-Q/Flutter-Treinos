import 'package:flutter/material.dart';
import 'package:simulation/product/postar_produto/componentes.dart';
import 'package:simulation/product/postar_produto/repositorio.dart';

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
  bool clickButton = true;

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
        title: const Text("Post new Product"),
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
            Column(
              children: [
                const Text("id"),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: TextField(
                    controller: idFixo,
                    textAlign: TextAlign.center,
                    decoration: comp.getTextFieldDecoration(false),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("title"),
                SizedBox(
                  width: size.width * 0.7,
                  height: 60,
                  child: TextField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: comp.getTextFieldDecoration(true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("description"),
                SizedBox(
                  width: size.width * 0.7,
                  height: 60,
                  child: TextField(
                    controller: description,
                    textAlign: TextAlign.center,
                    decoration: comp.getTextFieldDecoration(true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (clickButton) {
                  if (title.text.isNotEmpty && description.text.isNotEmpty) {
                    setState(() {
                      loadingProgress = true;
                      clickButton = false;
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
                    Future.delayed(const Duration(milliseconds: 5000), () {
                      setState(() {
                        clickButton = true;
                      });
                    });
                  } else {
                    snackBar = "Preencha os campos!";
                    loadingProgress = false;
                    clickButton = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(snackBar),
                      ),
                    );
                    Future.delayed(const Duration(milliseconds: 5000), () {
                      setState(() {
                        clickButton = true;
                      });
                    });
                  }
                }
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
