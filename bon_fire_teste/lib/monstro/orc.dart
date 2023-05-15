import 'package:bon_fire_teste/monstro/orc_sprite_sheet.dart';
import 'package:bon_fire_teste/skill/skills.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';

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
    if (controlMove && !canDie) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          executeAttack();
        },
        radiusVision: 80,
        margin: 4,
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

  bool canReceiveDamage = true;

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (canReceiveDamage && !canDie && AttackFromEnum.ENEMY != attacker) {
      cont++;
      canReceiveDamage = false;
      if (life - damage <= 0) {
        controlMove = false;
        canDie = true;
      }
      super.receiveDamage(attacker, damage, identify);
      //lastDirectionHorizontal == Direction.right
      if (controlMove) {
        controlMove = false;
        animation?.playOnce(
          OrcSpritSheet.reciveDamageRight,
          onFinish: () {
            controlMove = true;
          },
          flipX: lastDirectionHorizontal == Direction.right ? false : true,
        );
      }
      canReceiveDamage = true;
    }
  }

  bool canDie = false;
  bool forceRemove = true;
  @override
  void die() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (forceRemove) {
        removeFromParent();
      }
    });
    if (canDie) {
      controlMove = false;

      animation?.playOnce(
        OrcSpritSheet.dieRight,
        onFinish: () {
          removeFromParent();
          forceRemove = false;
        },
        flipX: lastDirectionHorizontal == Direction.right ? false : true,
      );
    }
    super.die();
  }

  int cont = 0;
}
