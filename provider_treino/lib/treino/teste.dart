import 'package:flutter/material.dart';

class HeroExample extends StatefulWidget {
  const HeroExample({super.key});

  @override
  State<HeroExample> createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  Size size = const Size(50.0, 50.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "ggg",
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.red,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  size = size.width == 50
                  ? size = const Size(100.0,100.0)
                  : size = const Size(50.0,50.0);
                  setState(() {
                    debugPrint("${size.width}");
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void _gotoDetailsPage(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute<void>(
  //     builder: (BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Second Page'),
  //       ),
  //       body: const Center(
  //         child: Hero(
  //           tag: 'hero-rectangle',
  //           child: BoxWidget(size: Size(200.0, 200.0)),
  //         ),
  //       ),
  //     ),
  //   ));
  // }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}
