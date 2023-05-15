import 'dart:math';

import 'package:bon_fire_teste/decoration/decoration_sprite_sheets.dart';
import 'package:bon_fire_teste/personagem/personagem.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';

class Mushroom extends GameDecoration with Sensor {
  Mushroom(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.mushroom,
          position: position,
          size: Vector2(16, 16),
        );

  int countLife = 0;
  bool retorna = false;
  int setupIntervalTime = 100;
  bool canGetLife = false;

  @override
  void onContact(GameComponent component) {
    if (component is Personagem && canGetLife) {
      if (retorna) {
        retorna = false;
        return;
      }
      component.addLife(3);
      countLife++;
      if (countLife > 1) {
        removeFromParent();
      }
      retorna = true;
      setupSensorArea(intervalCheck: setupIntervalTime);
      // debugPrint(component.toString());
    }
  }

  @override
  void onMount() {
    // teste1();
    teste2();
    super.onMount();
  }

  void teste2() async {
    int incrementControlX = 0;
    int controlX = 0;
    int contX = 0;
    int incrementControlY = 0;
    int controlY = 6;
    int contY = 0;
    Random random = Random();
    int numeroAleatorio = random.nextInt(156) + 150;
    int yy = (random.nextInt(2) == 1 ? 1 : -1);
    int xx = (random.nextInt(2) == 1 ? 1 : -1);
    double opacidade = 0.1;
    for (int i = 0; i < numeroAleatorio; i++) {
      contX++;
      contY++;
      opacity = opacidade;
      if (i % 15 == 0) {
        opacidade = double.parse((opacidade + 0.1).toStringAsFixed(2));
        if (opacidade > 1) {
          opacidade = 1;
        }
      }
      if (contY > controlY) {
        y += yy;
        incrementControlY++;
        if (incrementControlY > 8) {
          incrementControlY = 0;
          if (controlY > 4) controlY--;
        }
        // debugPrint("contX = $contX | controlX = $controlX");
        contY = 0;
      }

      if (contX > controlX) {
        x += xx;
        incrementControlX++;
        if (incrementControlX > 8) {
          incrementControlX = 0;
          controlX++;
        }
        // debugPrint("contX = $contX | controlX = $controlX");
        contX = 0;
      }
      await futuro(2);
    }

    for (int i = 0; i < 105; i++) {
      angle += 0.06;
      await futuro(5);
      // debugPrint("Angulo $angle");
    }
    angle = 0;
    canGetLife = true;
  }

  void teste1() async {
    for (int i = 0; i < 30; i++) {
      x = x + 1;
      y = y + 1;
      await futuro(20);
    }
  }

  Future<void> futuro(int mili) async {
    await Future.delayed(
      Duration(milliseconds: mili),
      () {},
    );
  }
}
