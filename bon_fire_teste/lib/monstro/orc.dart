import 'package:bon_fire_teste/monstro/orc_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Orc extends SimpleEnemy with ObjectCollision, UseBarLife {
  bool controlMove = true;
  Orc(Vector2 position)
      : super(
          position: position,
          size: Vector2(46, 46),
          speed: 40,
          animation: SimpleDirectionAnimation(
              idleRight: OrcSpritSheet.idleRight,
              runRight: OrcSpritSheet.runRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 18),
            align: Vector2(12, 23),
          ),
        ],
      ),
    );
  }
  @override
  void update(double dt) {
    //enableCollision(true/false);
    if (controlMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {},
        radiusVision: 80,
        margin: 4,
      );
    }
    super.update(dt);
  }

  @override
  void die() async {
    while (controlMove == false) {
      await Future.delayed(
        const Duration(milliseconds: 10),
      );
    }
    controlMove = false;
    animation?.playOnce(
      OrcSpritSheet.dieRight,
      onFinish: () {
        removeFromParent();
      },
    );
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) async {
    if (controlMove) {
      super.receiveDamage(attacker, damage, identify);
    }
    cont++;
    debugPrint("$cont $controlMove");
    if (lastDirectionHorizontal == Direction.right || controlMove && life > 0) {
      controlMove = false;
      animation?.playOnce(
        OrcSpritSheet.reciveDamageRight,
        onFinish: () {
          controlMove = true;
        },
        runToTheEnd: true,
      );
    }
  }

  int cont = 0;
}
