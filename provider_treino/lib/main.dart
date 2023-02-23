import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:provider_treino/enherit_widget/inherited_screen.dart';
import 'package:provider_treino/enherit_widget/inherited_widget.dart';
import 'package:provider_treino/provider/controller.dart';

void main() {
  runApp(const Tree());
}

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Controller())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "States",
        theme: ThemeData(primaryColor: Colors.blue),
        home: InheritedTreino(child: const InhertedScreen()),
      ),
    );
  }
}
