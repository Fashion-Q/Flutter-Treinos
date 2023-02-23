import 'package:flutter/material.dart';
import 'package:provider_treino/enherit_widget/inherited_widget.dart';

class InhertedScreen extends StatelessWidget {
  const InhertedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Treino"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              InheritedTreino.of(context).novoTexto("texto ");
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: InheritedTreino.of(context).textos),
      ),
    );
  }
}
