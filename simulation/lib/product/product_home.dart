import 'package:flutter/material.dart';
import 'deletar_produto/deletar_produto.dart';
import 'models/modelo.dart';
import 'postar_produto/postar_produto.dart';
import 'repositorio.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final Repositorio repositorio = Repositorio();
  Modelo? model;
  bool loadingProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Simulation"),
        centerTitle: true,
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
                    Navigator.pushNamed(context, "mostrarProdutos");
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
                onPressed: () {},
                child: const Text("Change Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
