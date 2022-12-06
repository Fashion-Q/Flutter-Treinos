import 'package:flutter/material.dart';

class Componentes {

  InputDecoration getTextFieldDecorationForm(bool boo) {
    return InputDecoration(
      filled: true,
      enabled: boo,
      fillColor: const Color.fromARGB(238, 202, 202, 202),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}