import 'package:flutter/material.dart';
import 'package:simulation/product/show_all_product.dart/componentes.dart';
import 'package:simulation/product/show_all_product.dart/repositorio.dart';

class MostrarProduto extends StatefulWidget {
  const MostrarProduto({super.key});

  @override
  State<MostrarProduto> createState() => _MostrarProdutoState();
}

class _MostrarProdutoState extends State<MostrarProduto> {
  final Componentes comp = Componentes();
  final Repositorio repositorio = Repositorio();

  bool loadingProgress = false;
  bool clickButton = true;
  bool showProduct = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Products"),
          centerTitle: true,
        ),
        body: showProduct
            ? SingleChildScrollView(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: repositorio.product),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_circle_up),
                            onPressed: () {
                              if (repositorio.indexProduct < 29) {
                                repositorio.changeProduct(1, context);
                                setState(() {});
                              }
                            },
                          ),
                          Text("${repositorio.indexProduct + 1}"),
                          IconButton(
                            icon: const Icon(Icons.arrow_circle_down),
                            onPressed: () {
                              if (repositorio.indexProduct > 0) {
                                repositorio.changeProduct(-1, context);
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      )
                    ]),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: loadingProgress,
                      child: const CircularProgressIndicator(
                        color: Color.fromARGB(255, 54, 244, 117),
                        strokeWidth: 7,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (clickButton) {
                          setState(() {
                            loadingProgress = true;
                            clickButton = false;
                          });
                          if (await repositorio.setModel(size, context)) {
                            showProduct = true;
                            setState(() {
                              loadingProgress = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Problema de conexão!",
                              textAlign: TextAlign.center,
                            )));
                            setState(() {
                              loadingProgress = false;
                            });
                            Future.delayed(const Duration(milliseconds: 5000),
                                () {
                              setState(() {
                                clickButton = true;
                              });
                            });
                          }
                        }
                      },
                      child: const Text("Click to show all products"),
                    ),
                  ],
                ),
              ));
  }
}
