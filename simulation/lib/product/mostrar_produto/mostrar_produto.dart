import 'package:flutter/material.dart';
import 'package:simulation/product/mostrar_produto/componentes.dart';
import 'package:simulation/product/repositorio.dart';

import '../models/modelo.dart';

class MostrarProduto extends StatefulWidget {
  const MostrarProduto({super.key});

  @override
  State<MostrarProduto> createState() => _MostrarProdutoState();
}

class _MostrarProdutoState extends State<MostrarProduto> {
  final Componentes comp = Componentes();
  final Repositorio repositorio = Repositorio();

  bool loadingProgress = false;
  List<Modelo>? modelo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Products"),
          centerTitle: true,
        ),
        body: modelo != null
            ? SizedBox(
                width: size.width,
                height: size.height,
                child: ListView.builder(
                  itemCount: modelo?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return comp.getContainer(
                        size.width, 200, index, modelo![index]);
                  },
                ),
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
                        if (!loadingProgress) {
                          setState(() {
                            loadingProgress = true;
                          });
                          if (await repositorio.setModel()) {
                            modelo = repositorio.getModel();
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
                            Future.delayed(const Duration(milliseconds: 5000), () {
                              setState(() {
                                loadingProgress = false;
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
