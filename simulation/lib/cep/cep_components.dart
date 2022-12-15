import 'package:flutter/material.dart';

import 'cep_model.dart';

class CepComponentes {
  TextStyle getAppBarTextStyle() {
    return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(-1.0, -1.0),
            blurRadius: 0.5,
            color: Color.fromARGB(255, 227, 19, 255),
          ),
        ]);
  }

  Widget getImageBackGround(double height, String path) {
    return SizedBox(
        height: height,
        child: Image.asset(
          path,
          fit: BoxFit.fill,
        ));
  }

  Widget getAppBar() {
    return AppBar(
      title: const Text(
        "Busque um CEP do Brasil!",
      ),
      titleTextStyle: getAppBarTextStyle(),
      centerTitle: true,
    );
  }

  InputDecoration getTextFieldExemple() {
    return InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 29, 214, 220),
        labelText: "Ex: 49504450",
        labelStyle: const TextStyle(
          color: Color.fromARGB(249, 0, 0, 0),
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        hintMaxLines: 8,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.solid,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 37, 14, 241),
            width: 3.0,
          ),
        ));
  }

  InputDecoration getTextFieldDecorationFormNotEnabled() {
    return InputDecoration(
      filled: true,
      enabled: false,
      fillColor: const Color.fromARGB(238, 202, 202, 202),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget getRowCep(Size size, ModelCep modelo, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 0.4 * size.width,
          height: 80,
          child: TextField(
            controller: modelo.constCep[index],
            textAlign: TextAlign.end,
            decoration: getTextFieldDecorationFormNotEnabled(),
          ),
        ),
        SizedBox(
          width: 0.5 * size.width,
          height: 80,
          child: TextField(
            controller: modelo.newCep[index],
            decoration: getTextFieldDecorationFormNotEnabled(),
          ),
        ),
      ],
    );
  }
}