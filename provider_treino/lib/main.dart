import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:provider_treino/provider/controller.dart';
import 'package:provider_treino/provider/provider_teste.dart';

void main() {
  runApp(const Tree());
}

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Provider",
        theme: ThemeData(primaryColor: Colors.blue),
        home: const ProviderTeste(),
      ),
    );
  }
}
