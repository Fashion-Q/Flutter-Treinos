import 'package:dio/dio.dart';

import '../models/modelo.dart';

class Repositorio {
  Modelo? model;
  bool deletado = false;
  String? data;

  Future<bool> deletar(int n) async {
    deletado = false;
    String path = "https://dummyjson.com/products/$n";
    try {
      Response res = await Dio().delete(path);
      model = Modelo.fromJson(res.data);
      //model = getModeloDeletado(res.data);
      deletado = res.data["isDeleted"];
      data = res.data["deletedOn"];
    } on Exception {
      deletado = false;
    }
    return deletado;
  }
}
