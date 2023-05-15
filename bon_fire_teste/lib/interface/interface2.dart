import 'package:bon_fire_teste/main.dart';
import 'package:bon_fire_teste/personagem/personagem.dart';
// import 'package:bon_fire_teste/personagem/sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

class Interface2 extends StatefulWidget {
  const Interface2({super.key, required this.game});
  static const overlayKey = "interface2";
  final BonfireGame game;
  @override
  State<Interface2> createState() => _Interface2State();
}

class _Interface2State extends State<Interface2> {
  late async.Timer lifetime;
  double life = 0;
  final double maxWid = 100;
  double currentLife = 100;

  @override
  void initState() {
    lifetime = async.Timer.periodic(
      const Duration(milliseconds: 100),
      verificarVida,
    );
    //widget.game.
    super.initState();
  }

  @override
  void dispose() {
    lifetime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(121, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/teste/heroTalk.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              Container(
                width: currentLife,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                ),
              ),
              Container(
                width: maxWid,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: followerWidget,
              child: const Text("Avatar"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: dialog,
              child: const Text("Dialog"),
            ),
          ),
        ],
      ),
    );
  }

  void dialog() async {
    Future.delayed(const Duration(milliseconds: 1), () async {
      for (int i = 0; i < 10; i++) {
        await Future.delayed(
          const Duration(milliseconds: 50),
        );
        widget.game.player?.joystickChangeDirectional(
          JoystickDirectionalEvent(directional: JoystickMoveDirectional.IDLE),
        );
        // debugPrint("i = $i");
      }
    });
    // widget.game.joystick?.cleanObservers();
    MyHomePageState.setStateMaster!();
    // var q = widget.game.joystick;
    // q?.removeFromParent();

    Future.delayed(const Duration(milliseconds: 1), () {});
    TalkDialog.show(
      widget.game.context,
      [
        Say(
          text: [
            const TextSpan(text: "Vou ai visse"),
          ],
          person: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.5),
            child: Image.asset(
              'assets/images/teste/heroTalk.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Say(
            text: [
              const TextSpan(text: "Oxe só se for agora visse"),
            ],
            person: Container(
              width: 100,
              height: 100,
              color: Colors.red.withOpacity(0.5),
              child: Image.asset(
                'assets/images/teste/orcTalk.png',
                fit: BoxFit.cover,
              ),
            ),
            personSayDirection: PersonSayDirection.RIGHT),
        Say(
          text: [
            const TextSpan(text: "Visse Visse"),
          ],
          person: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.5),
            child: Image.asset(
              'assets/images/teste/heroTalk.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      onFinish: () {
        // widget.game.joystick?.addObserver(
        //   widget.game.player!,
        // );
      },
      // onClose: () {
      //   debugPrint("OnClose");
      // },
      // onChangeTalk: (int? id) {
      //   debugPrint("onChangeTalk id = $id");
      // },
    );
  }

  void followerWidget() {
    debugPrint("${widget.game.enemies().length}");
    if (FollowerWidget.isVisible('identify')) {
      FollowerWidget.remove('identify');
    } else {
      FollowerWidget.show(
        identify: 'identify',
        context: widget.game.context,
        target: widget.game
            .visibleComponents()
            .lastWhere((element) => element is Personagem),
        child: Image.asset('assets/images/teste/dab2.png'),
      );
    }
  }

  void verificarVida(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;
        final percent = life / (widget.game.player?.maxLife ?? 0);
        currentLife = maxWid * percent;
      });
    }
  }
}
