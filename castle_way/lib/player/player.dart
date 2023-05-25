import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:castle_way/player/helper_directional.dart';
import 'package:castle_way/player/player_sprite_sheet.dart';

class MyPlayer extends SimplePlayer
    with HelperDirectional, ObjectCollision, Lighting {
  MyPlayer(Vector2 position)
      : super(
          size: Vector2(80, 80),
          position: position,
          //350
          speed: 350,
          animation: SimpleDirectionAnimation(
            idleRight: MyPlayerSpritSheet.idleRight,
            runRight: MyPlayerSpritSheet.runRight,
            runUpLeft: MyPlayerSpritSheet.runUpJumpLeft,
            runUpRight: MyPlayerSpritSheet.runUpJumpRight,
          ),
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
          size: Vector2(14, 40),
          align: Vector2(33, 22),
        ),
      ]),
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
  @override
  void update(double dt) {
    if (canUpdate && canColision) {
      if (!jumping) {
        count++;
        if (count > 10000) {
          count = 10;
          // debugPrint("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        }
        if (count == 4) {
          falseFloor();
        }
      } else {
        countJump++;
        if (countJump > 20) {
          jumping = false;
          count = 0;
        }
      }
    }
    super.update(dt);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    // debugPrint(
    //     "${(component.y - y).toString()} | above ${component.aboveComponents} | floor: ${floor.toString()} | jumping : ${jumping.toString()} ${component.toString()}");
    if (canColision && (component.y - y) > 57 && !jumping) {
      if (!floor && !jumping) {
        y = component.y - (63.7810);
        canUpdate = false;
        trueFloor();
      }
      count = 0;
    } else if (jumping && component is TileWithCollision ||
        component is GameDecorationWithCollision) {
      //component is GameDecorationWithCollision
      if (component.y - y < 7) {
        countJump = 100;
      }
    }
    return super.onCollision(component, active);
  }
}
