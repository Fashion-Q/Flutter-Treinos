import 'package:bon_fire_teste/globals.dart';
import 'package:bon_fire_teste/main.dart';
import 'package:bon_fire_teste/personagem/sprite_sheet.dart';
import 'package:bon_fire_teste/skill/skills.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Personagem extends SimplePlayer
    with ObjectCollision, Lighting, UseBarLife {
  Personagem(Vector2 position)
      : super(
          size: Vector2(tileSize, tileSize),
          position: position,
          speed: 80,
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
        color: Colors.transparent,
        blurBorder: 5,
        withPulse: true,
        pulseVariation: 0.1,
        pulseSpeed: 1.5,
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    //animation?.playOnce(animation);
    return super.onCollision(component, active);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      esecuteAttack();
    }

    super.joystickAction(event);
  }

  void esecuteAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(24, 24),
      sizePush: 10,
      animationRight: CorteBranco.cortebrancoRight,
    );
  }

  /*@override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    super.joystickChangeDirectional(event);
  }*/
}
