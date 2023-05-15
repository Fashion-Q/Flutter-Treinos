import 'package:bon_fire_teste/skill/skills.dart';
import 'package:bon_fire_teste/testes/rena_sprite_sheet.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';

class Rena extends SimpleEnemy
    with ObjectCollision, UseBarLife, AutomaticRandomMovement {
  bool controlMove = true;
  Rena(Vector2 position)
      : super(
          position: position,
          size: Vector2(28, 28),
          speed: 40,
          animation: SimpleDirectionAnimation(
              idleRight: RenaSpritSheet.idleRight,
              runRight: RenaSpritSheet.runRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 18),
            align: Vector2(0, 10),
          ),
        ],
      ),
    );
  }
  @override
  void update(double dt) {
    //enableCollision(true/false);
    if (controlMove) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) {
              executeAttack();
            },
            radiusVision: 80,
            margin: 4,
          );
        },
        notObserved: () {
          runRandomMovement(dt);
        },
        radiusVision: 80,
      );
    }
    super.update(dt);
  }

  void executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(32, 32),
      sizePush: 10,
      animationRight: CorteBranco.cortebrancoRight,
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (controlMove && AttackFromEnum.ENEMY != attacker) {
      super.receiveDamage(attacker, damage, identify);
    }
    if (lastDirectionHorizontal == Direction.right ||
        controlMove && life > 0 && AttackFromEnum.ENEMY != attacker) {
      controlMove = false;

      animation?.playOnce(
        RenaSpritSheet.reciveDamageRight,
        onFinish: () {
          controlMove = true;
        },
        runToTheEnd: true,
      );
    }
  }

  bool forceRemove = true;

  @override
  void die() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (forceRemove) {
        removeFromParent();
      }
    });
    controlMove = false;
    animation?.playOnce(
      RenaSpritSheet.dieRight,
      onFinish: () {
        removeFromParent();
        forceRemove = false;
      },
      runToTheEnd: true,
    );
    super.die();
  }

  int cont = 0;
}
