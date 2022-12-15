import 'package:flutter/material.dart';
import 'package:simulation/root_page/root_controller.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: RootController.controller.comp.getDrawer(size),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              size.width < 450
              ? RootController.controller.comp.getAppBar()
              : const SizedBox(width: 0,height: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "cep");
                  },
                  child: const Text("CEP Simulation"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "product");
                  },
                  child: const Text("Product Simulation"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
