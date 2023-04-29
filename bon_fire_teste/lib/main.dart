import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MMyHomePage(),
    );
  }
}

class MMyHomePage extends StatelessWidget {
  const MMyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(map: WorldMapByTiled('maps/teste123_atual.json'));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/maps/forest.png"),
      ),
    );
  }
}