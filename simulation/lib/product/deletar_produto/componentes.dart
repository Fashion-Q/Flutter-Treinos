import 'package:flutter/material.dart';

class Componentes {
  InputDecoration getTextFieldDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(34, 29, 214, 220),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        hintMaxLines: 2,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.solid,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 3.0,
          ),
        ));
  }
}