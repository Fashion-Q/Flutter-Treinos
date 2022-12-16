import 'package:flutter/material.dart';
import 'package:simulation/cep/cep_screen.dart';
import 'package:simulation/product/deletar_produto/deletar_produto.dart';
import 'package:simulation/product/postar_produto/postar_produto.dart';
import 'package:simulation/product/show_all_product.dart/mostrar_produto.dart';
import 'package:simulation/product/product_home.dart';
import 'package:simulation/root_page/root_controller.dart';
import 'package:simulation/root_page/root_screen.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: RootController.controller,
      builder: (context, child) => MaterialApp(
        title: "Simulation",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: RootController.controller.boolDarkTheme
          ? Brightness.dark
          : Brightness.light
        ),
        initialRoute: "home",
        routes: {
          "home" :(context) => RootScreen(),
          "cep" :(context) => const Cep(),
          "product" :(context) => const Product(),
          "mostrarProdutos" :(context) => const MostrarProduto(),
          "PostNewProduct" :(context) => const PostarProduto(),
          "DeletarProduto" :(context) => const DeletarProduto(),

        },
      ),
    );
  }
}
