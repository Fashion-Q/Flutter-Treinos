import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {
  const PlayerInterface({super.key, required this.game});
  final BonfireGame game;
  static const overlayKey = "playerIntarface";

  @override
  PlayerIntarfaceState createState() => PlayerIntarfaceState();
}

class TestBarLife {
  static Function? notifuer;
  static justNotifier(Function a) {
    notifuer = a;
  }
}

class PlayerIntarfaceState extends State<PlayerInterface> {
  @override
  void initState() {
    TestBarLife.justNotifier(test);
    super.initState();
  }

  void test() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //AnimatedContainer(duration: const Duration(milliseconds: 500));
    return (widget.game.player?.life ?? 0) > 0
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            width: (widget.game.player?.life ?? 1),
            height: 20,
            color: Colors.green,
            margin: const EdgeInsets.only(left: 15, top: 15),
          )
        : const SizedBox();
  }
}
