import 'package:bon_fire_teste/globals.dart';
import 'package:bon_fire_teste/personagem/sprite_sheet.dart';
import 'package:bon_fire_teste/skill/skills.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Personagem extends SimplePlayer with ObjectCollision, Lighting {
  Personagem(Vector2 position)
      : super(
          size: Vector2(tileSize, tileSize),
          position: position,
          speed: 160,
          animation: SimpleDirectionAnimation(
              idleRight: PersonagemSpritSheet.idleRight,
              runRight: PersonagemSpritSheet.runRight),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 18),
            align: Vector2(7, 16),
          ),
        ],
      ),
    );
    setupLighting(
      LightingConfig(
          radius: 70,
          color: Colors.red.withOpacity(0.2),
          blurBorder: 5,
          withPulse: true,
          pulseVariation: 0.1,
          pulseSpeed: 1.5,
          pulseCurve: Curves.decelerate),
    );
  }

  bool controlMove = true;

  @override
  bool onCollision(GameComponent component, bool active) {
    //animation?.playOnce(animation);
    return super.onCollision(component, active);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId) &&
        controlMove) {
      executeAttack();
      //testeCamera();
      super.joystickAction(event);
    }
  }

  void testeCamera() {
    final inimigo = gameRef.visibleEnemies().first;
    if (camera) {
      gameRef.camera.moveToTargetAnimated(inimigo, zoom: 1.5 * 2);
    } else {
      gameRef.camera.moveToTargetAnimated(this, zoom: 1.5);
      //gameRef.camera.shake();
    }
    camera = !camera;
  }

  bool canExecuteAttack = true;

  void executeAttack() {
    if (canExecuteAttack) {
      canExecuteAttack = false;
      Future.delayed(const Duration(milliseconds: 100), () {
        canExecuteAttack = true;
      });
      simpleAttackMelee(
        damage: 10,
        size: Vector2(24, 24),
        sizePush: null,
        withPush: false,
        animationRight: CorteBranco.cortebrancoRight,
      );
    }
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (life - damage <= 0) {
      addLife(100);
      //TestBarLife.notifuer!();
    } else if (controlMove) {
      controlMove = false;
      super.receiveDamage(attacker, damage, identify);
      animation?.playOnce(
        PersonagemSpritSheet.reciveDamageRight,
        onFinish: () {
          controlMove = true;
          joystickChangeDirectional(
            JoystickDirectionalEvent(directional: JoystickMoveDirectional.IDLE),
          );
        },
        flipX: lastDirectionHorizontal == Direction.right ? false : true,
        runToTheEnd: true,
      );
    }
    if (life <= 0) {
      controlMove = false;
    }
  }

  @override
  void die() {
    animation?.playOnce(
      lastDirectionHorizontal == Direction.right
          ? PersonagemSpritSheet.dieRight
          : PersonagemSpritSheet.dieLeft,
      onFinish: () {
        removeFromParent();
      },
      runToTheEnd: true,
    );
    super.die();
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (controlMove) {
      super.joystickChangeDirectional(event);
    }
  }

  int cont2 = 0;
  int cont = 0;
  bool camera = true;
}
