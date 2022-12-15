import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ModelCep {
  List<String> chave = [
    "cep",
    "logradouro",
    "complemento",
    "bairro",
    "localidade",
    "uf",
    "ibge",
    "gia",
    "ddd",
    "siafi"
  ];
  List<TextEditingController> newCep =
      List.generate(10, (i) => TextEditingController());
  List<TextEditingController> constCep =
      List.generate(10, (i) => TextEditingController());

  /*
  factory ModeloCep.fromMap(Map<String, dynamic> map) {
    return ModeloCep(cep: map["cep"] ?? "");
  }*/

  ModelCep() {
    for (int i = 0; i < chave.length; i++) {
      newCep[i].text = "Sem informação";
      constCep[i].text = chave[i].toUpperCase();
    }
  }

  Future<String> changeCep(String? newCep) async {
    try {
      final Response<dynamic> result =
          await Dio().get("https://viacep.com.br/ws/$newCep/json/");

      Map<String, dynamic> map = result.data;

      bool? error = map["erro"];

      if (error != null && error) {
        _reset();
        return "Cep não encontrado!";
        //print("CEP Não encontrado bool $newCep \n");
      } else {
        if (map["cep"] == null) {
          return "Problema de conexão!";
        }
        for (int i = 0; i < chave.length; i++) {
          this.newCep[i].text = map[chave[i]]; //"cep"
          //print("${chave[i]} || ${buscaCEP[i].text}");
          if (this.newCep[i].text == "") this.newCep[i].text = "Sem informação";
        }
        return "Cep encontrado com sucesso!";
      }
    } catch (e) {
      //print("Não encontrado catch $newCep \n");
      _reset();
      return "Cep não encontrado!";
    }
  }

  void _reset() {
    for (int i = 0; i < newCep.length; i++) {
      newCep[i].text = "Sem informação";
    }
  }
}
