import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:castle_way/decoration/decoration_sprite_sheets.dart';
import 'package:castle_way/game/game.dart';
import 'package:castle_way/repository/mapa_world.dart';
import 'package:castle_way/share/widgets.dart';

class ControllerStage extends GameDecoration with Sensor, Lighting {
  // ignore: annotate_overrides
  final BuildContext context;
  final String nextOrReturn;
  final RepositoryMapWorld repository = RepositoryMapWorld();
  final Map<String, dynamic> currentStageMAP;

  late final String? nextStageSTR;
  late final Map<String, dynamic>? nextStageMAP;
  late final Vector2? playerNextPosition;

  ControllerStage(Vector2 position, Vector2 size, this.context,
      this.nextOrReturn, this.currentStageMAP)
      : super.withSprite(
          sprite: DecorationSpriteSheet.spriteVazia,
          position: position,
          size: size,
        ) {
    setupLighting(
      LightingConfig(
          radius: 20,
          color: Colors.deepOrangeAccent.withOpacity(0.5),
          blurBorder: 5,
          withPulse: true,
          pulseVariation: 0.1,
          pulseSpeed: 1.5,
          pulseCurve: Curves.decelerate),
    );
    setupSensorArea(intervalCheck: 50);
  }

  bool nextStageBoo = true;

  @override
  void onContact(GameComponent component) {
    if (component is Player && nextStageBoo) {
      nextStageBoo = false;
      navigator(context);
    }
  }

  void navigator(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GameMaster(
          currentStage: nextStageMAP!,
          playerInitPosition: playerNextPosition!,
        ),
      ),
    );
  }

  String getNextStageStr(
      Map<String, Map<String, dynamic>> mapa, int controlMap) {
    List<String> stageKeys = mapa.keys.toList();
    String currentStageSTR = currentStageMAP['tiled'];
    currentStageSTR = currentStageSTR.substring(12, 18);
    //substring(5,11);
    int currentindex = stageKeys.indexOf(currentStageSTR);
    if (currentindex != -1 &&
        currentindex + controlMap >= 0 &&
        currentindex + controlMap < stageKeys.length) {
      return stageKeys[currentindex + controlMap];
    }
    return 'stage1';
  }

  Vector2 getVector(Map<String, dynamic> nextMap, String key) {
    return Vector2(double.parse(nextMap[key][0].toString()) * tiledSize,
        double.parse(nextMap[key][1].toString()) * tiledSize);
  }

  Future<void> fixNextStage() async {
    Map<String, Map<String, dynamic>>? mapa = await repository.getGameMap();
    int controlStage = 0;
    String nextStageOrReturn = 'playerNext';

    if (nextOrReturn == 'next') {
      controlStage = 1;
      nextStageOrReturn = 'playerReturn';
      await repository.saveCurrentStage(currentStageMAP);
    } else {
      controlStage = -1;
    }
    nextStageSTR = getNextStageStr(mapa, controlStage);
    nextStageMAP = mapa[nextStageSTR]!;
    nextStageMAP!
        .remove(nextOrReturn == 'next' ? "playerNext" : "playerReturn");
    playerNextPosition = getVector(nextStageMAP!, nextStageOrReturn);
  }

  @override
  Future<void> onLoad() async {
    await fixNextStage();
    return super.onLoad();
  }
}
