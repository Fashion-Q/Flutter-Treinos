import 'package:dio/dio.dart';
import 'package:produto/models/modelo.dart';

class Repositorio {
  bool postado = false;
  Modelo? model;
  List t = ["queijo", "alado"];
  Future<bool> enviar(String id, String title, String description) async {
    postado = false;
    Map<String, dynamic> mapa = {
      "id": int.parse(id),
      "title": title,
      "description": description,
      "price": 10.0,
      "discountPercent": 10.0,
      "rating": 5.0,
      "stock": 55,
      "brand": "queokp",
      "category": "category",
      "smartphones": "smartphones",
      "thumbnail": "thumbnail",
      "images": t
    };
    try {
      Response res =
          await Dio().post("https://dummyjson.com/products/add", data: mapa);
      model = getModeloPostado(res.data);
      postado = true;
    } on Exception {
      postado = false;
    }
    return postado;
  }

  Modelo getModeloPostado(Map<String, dynamic> mapa) {
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
}
