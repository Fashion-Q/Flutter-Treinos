import 'models/modelo.dart';
import 'package:dio/dio.dart';

class Repositorio {
  List<Modelo> model = [];

  Future<bool> setModel() async {
    try {
      final Response<dynamic> res =
          await Dio().get("https://dummyjson.com/products");
      model.clear();

      for (int i = 0; i < res.data["products"].length; i++) {
        Map<String, dynamic> mapa = res.data["products"][i];

        model.add(Modelo(
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
            images: mapa["images"] ?? ["No info"]));
      }
      return true;
    } on Exception {
      model.clear();
    }
    return false;
  }

  List<Modelo> getModel() {
    return model;
  }
}
