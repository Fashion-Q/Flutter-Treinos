import 'package:flutter/material.dart';
import 'package:produto/models/modelo.dart';
import 'package:produto/mostrar_produto/componentes.dart';

class MostrarProduto extends StatelessWidget {
  MostrarProduto({super.key, required this.modelo});
  final List<Modelo> modelo;
  final Componentes comp = Componentes();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        width: size.width,
        height: size.height,
        child: Center(
          child: SizedBox(
            width: size.width * 0.9,
            height: size.height,
            child: ListView.builder(
              itemCount: modelo.length,
              itemBuilder: (BuildContext context, int index) {
                return comp.getContainer(size.width,200,index,modelo[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
