import 'package:flutter/material.dart';
import 'package:produto/repositorio.dart';
import 'package:produto/deletar_produto/deletar_produto.dart';
import 'package:produto/postar_produto/postar_produto.dart';

import 'models/modelo.dart';
import 'mostrar_produto/mostrar_produto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Repositorio repositorio = Repositorio();
  Modelo? model;
  bool loadingProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lojinha do Verelindo"),
        leading: const SizedBox(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Visibility(
              visible: loadingProgress,
              child: const CircularProgressIndicator(
                color: Color.fromARGB(255, 54, 244, 117),
                strokeWidth: 7,
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      loadingProgress = true;
                    });
                    await repositorio.setModel();
                    setState(() {
                      loadingProgress = false;
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MostrarProduto(
                                  modelo: repositorio.getModel(),
                                )));
                  },
                  child: const Text("Show all Products")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostarProduto()));
                },
                child: const Text("Post new Product"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // repositorio.deletarProduto();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeletarProduto()));
                },
                child: const Text("Delet Product"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(240, 129, 128, 128),
                ),
                onPressed: () {
                  
                },
                child: const Text("Change Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
