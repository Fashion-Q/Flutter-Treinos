import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ModeloCep {
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
  List<TextEditingController> novoCEP =
      List.generate(10, (i) => TextEditingController());
  List<TextEditingController> fixoCEP =
      List.generate(10, (i) => TextEditingController());

  /*
  factory ModeloCep.fromMap(Map<String, dynamic> map) {
    return ModeloCep(cep: map["cep"] ?? "");
  }*/

  ModeloCep() {
    for (int i = 0; i < chave.length; i++) {
      novoCEP[i].text = "Sem informação";
      fixoCEP[i].text = chave[i].toUpperCase();
    }
  }

  changeCep(String? newCep) async {
    if (newCep != null && newCep.length > 7) {
      try {
        final Response<dynamic> result =
            await Dio().get("https://viacep.com.br/ws/$newCep/json/");

        Map<String, dynamic> map = result.data;
        //print(map[chave[0]]);

        bool? error = map["erro"];

        if (error != null && error) {
          _reset();
          //print("CEP Não encontrado bool $newCep \n");
        } else {
          for (int i = 0; i < chave.length; i++) {
            novoCEP[i].text = map[chave[i]]; //"cep"
            //print("${chave[i]} || ${buscaCEP[i].text}");
            if (novoCEP[i].text == "") novoCEP[i].text = "Sem informação";
          }
        }
      } catch (e) {
        //print("Não encontrado catch $newCep \n");
        _reset();
      }
    } else {
      _reset();
      //print("O CEP precisa ter 8 digitos!");
    }
  }

  void _reset() {
    for (int i = 0; i < novoCEP.length; i++) {
      novoCEP[i].text = "Sem informação";
    }
  }
}
