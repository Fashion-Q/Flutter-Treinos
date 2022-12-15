import 'package:dio/dio.dart';

import '../models/modelo.dart';

class Repositorio {
  Modelo? model;
  bool deletado = false;
  String? data;

  Modelo getModeloDeletado(Map<String, dynamic> mapa) {
    return Modelo(
        id: mapa["id"] ?? 0,
        title: mapa["title"] ?? "No info",
        description: mapa["description"] ?? "No info",
        price: mapa["price"] ?? -1.0,
        discountPercentage: mapa["discountPercentage"] ?? 0.0,
        rating: mapa["rating"] ?? 0.0,
        stock: mapa["stock"] ?? 0,
        brand: mapa["brand"] ?? "No info",
        category: mapa["category"] ?? "No info",
        thumbnail: mapa["thumbnail"] ?? "No info",
        images: mapa["images"] ?? ["No info"]);
  }

  Future<bool> deletar(int n) async {
    deletado = false;
    String path = "https://dummyjson.com/products/$n";
    try {
      Response res = await Dio().delete(path);
      model = getModeloDeletado(res.data);
      deletado = res.data["isDeleted"];
      data = res.data["deletedOn"];
    } on Exception {
      deletado = false;
    }
    return deletado;
  }
}
