import 'package:flutter/material.dart';
import 'package:gambiarra/cep/cep.dart';

void main() {
  runApp(const TheStart());
}

class TheStart extends StatelessWidget {
  const TheStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Verelindo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {"/": (context) => const Cep()});
  }
}
