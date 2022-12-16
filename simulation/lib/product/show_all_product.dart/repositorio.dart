import 'package:flutter/cupertino.dart';

import '../models/modelo.dart';
import 'package:dio/dio.dart';

class Repositorio {
  List<Modelo> model = [];
  List<Widget> product = [];
  Size? size;
  int indexProduct = -1;
  BuildContext? context;

  Future<bool> setModel(Size size, BuildContext context) async {
    try {
      final Response<dynamic> res =
          await Dio().get("https://dummyjson.com/products");
      model.clear();
      Map<String, dynamic> mapa;

      for (int i = 0; i < res.data["products"].length; i++) {
        mapa = res.data["products"][i];
        model.add(Modelo.fromJson(mapa));
      }
      this.size = size;
      indexProduct = -1;
      // ignore: use_build_context_synchronously
      changeProduct(1, context);
      return true;
    } on Exception {
      model.clear();

      return false;
    }
  }

  void changeProduct(int typeIncrement, BuildContext context) {
    product.clear();
    product.add(Container(color: const Color.fromARGB(231, 168, 168, 168),child: const Text("Só falta um desiner bom :("),));
    indexProduct += typeIncrement;
    Map<String, dynamic> mapa = model[indexProduct].toJson();
    List<String> key = model[indexProduct].toKey();
    for (int i = 0; i < key.length - 1; i++) {
      product.add(getWidget(key[i], mapa[key[i]], context));
    }
    for (int i = 0; i < mapa[key[key.length - 1]].length; i++) {
      product.add(getWidget(
          key[key.length - 1], mapa[key[key.length - 1]][i], context));
    }
  }

  Widget getWidget(String key, dynamic value, BuildContext context) {
    if (value is double && key != "id" && key != "stock") {
      value = key == "price" ? "$value \$" : "$value %";
    }

    if (key == "thumbnail" || key == "images") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          children: [
            Text("[$key]"),
            Container(
              color: const Color.fromARGB(231, 168, 168, 168),
              width: size!.width * 0.8,
              child: Image.network(
                value,
                errorBuilder: (BuildContext context,
                    Object exception,
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    StackTrace) {
                  return Image.asset("assets/imagens/product/nophoto.png");
                },
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        width: size!.width * 0.8,
        color: const Color.fromARGB(40, 168, 168, 168),
        child: Text("[$key]  $value"),
      ),
    );
  }
}
