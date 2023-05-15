import 'package:bon_fire_teste/decoration/decoration_sprite_sheets.dart';
import 'package:bon_fire_teste/decoration/mushroom.dart';
import 'package:bon_fire_teste/globals.dart';
import 'package:bon_fire_teste/personagem/personagem.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Chess extends GameDecoration
    with ObjectCollision, TapGesture, DragGesture {
  //with Sensor
  bool playerIsClose = false;

  Sprite? chess, chessOpen;

  bool changeBooRender = false;
  @override
  void update(double dt) {
    seeComponentType<Personagem>(
      observed: (player) {
        if (!playerIsClose) {
          playerIsClose = true;
          canRenderr = true;
          changeBooRender = true;
          //_mostrarDialogo();
        }
      },
      notObserved: () {
        if (changeBooRender) {
          playerIsClose = false;
          canRenderr = true;
          changeBooRender = false;
        }
      },
      radiusVision: tileSize,
    );
    super.update(dt);
  }

  void mostrarDialogo() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: const Text("Redpill"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  bool canRenderr = false;

  @override
  void render(Canvas canvas) {
    if (canRenderr == true) {
      if (!playerIsClose) {
        sprite = chess;
      } else {
        sprite = chessOpen;
        gameRef.player?.joystickChangeDirectional(
          JoystickDirectionalEvent(directional: JoystickMoveDirectional.IDLE),
        );
      }
      canRenderr = false;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    chess = await DecorationSpriteSheet.chess;
    chessOpen = await DecorationSpriteSheet.chessOpen;
    return super.onLoad();
  }

  Chess(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.chess,
          position: position,
          size: Vector2(16, 32),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16, 16),
            align: Vector2(0, 16),
          ),
        ],
      ),
    );
  }

  @override
  void onTap() {
    if (playerIsClose) {
      //_mostrarDialogo();
      gameRef.add(
        Mushroom(Vector2(position.x, position.y + 25)),
      );
    }
  }
}
