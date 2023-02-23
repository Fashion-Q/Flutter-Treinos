import 'package:flutter/material.dart';

class Treinos extends StatefulWidget {
  const Treinos({super.key});

  @override
  State<Treinos> createState() => _Train();
}

class _Train extends State<Treinos> {
  double width = 200.0;
  final String s1 =
      "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_0.jpg";
  final String s2 =
      "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_1.jpg";
  final String s3 =
      "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_4.jpg";
  final String s4 =
      "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ahri_5.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flex"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: Image.network(s1),
            ),
          ),
          AnimatedContainer(
            width: width,
            duration: const Duration(seconds: 2),
            child: ElevatedButton(
              onPressed: () {
                width = width == 200 ? 350 : 200;
                setState(() {
                  
                });
              },
              child: Image.network(s1),
            ),
          ),
        ],
      ),
    );
  }
}
