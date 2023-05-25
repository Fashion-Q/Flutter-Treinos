import 'package:bonfire/bonfire.dart';
import 'package:castle_way/player/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:castle_way/game/controller_stage.dart';
// import 'package:flutter/services.dart';
import 'package:castle_way/share/widgets.dart';
import 'package:castle_way/ui/controller.dart';
import 'package:castle_way/ui/helpers/loader.dart';
import 'package:castle_way/ui/helpers/size.dart';
import 'package:castle_way/ui/module.dart';

class GameMaster extends StatefulWidget {
  const GameMaster(
      {super.key,
      required this.currentStage,
      required this.playerInitPosition});
  final Map<String, dynamic> currentStage;
  final Vector2 playerInitPosition;

  @override
  State<GameMaster> createState() => _GameMasterState();
}

class _GameMasterState extends State<GameMaster> with LoaderStage {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      lightingColorGame: Colors.black.withOpacity(0.7),
      showCollisionArea: false,
      player: MyPlayer(
         widget.playerInitPosition,
      ),
      cameraConfig: CameraConfig(
        zoom: 1.0,
        moveOnlyMapArea: true,
        smoothCameraEnabled: true,
        smoothCameraSpeed: 9,
      ),
      map: WorldMapByTiled(
        widget.currentStage['tiled'],
        objectsBuilder: {
          'next': (properties) => ControllerStage(properties.position,
              properties.size, context, "next", widget.currentStage),
          'return': (properties) => ControllerStage(properties.position,
              properties.size, context, "return", widget.currentStage),
        },
        forceTileSize: Vector2(tiledSize, tiledSize),
      ),
      joystick: Joystick(
        // directional: JoystickDirectional(),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.purple,
            margin: const EdgeInsets.only(right: 100, top: 20),
            size: 70,
            align: JoystickActionAlign.TOP_RIGHT,
          ),
          JoystickAction(
            actionId: 2,
            color: Colors.orangeAccent,
            margin: const EdgeInsets.only(right: 20, top: 20),
            size: 70,
            align: JoystickActionAlign.TOP_RIGHT,
          ),
          JoystickAction(
            actionId: 11,
            color: Colors.purple,
            margin: const EdgeInsets.only(bottom: 20, left: 20),
            size: 70,
            align: JoystickActionAlign.BOTTOM_LEFT,
          ),
          JoystickAction(
            actionId: 12,
            color: Colors.orangeAccent,
            margin: const EdgeInsets.only(bottom: 20, left: 100),
            size: 70,
            align: JoystickActionAlign.BOTTOM_LEFT,
          ),
          JoystickAction(
            actionId: 3,
            color: Colors.orangeAccent,
            margin: const EdgeInsets.only(bottom: 20, right: 20),
            size: 70,
            // align: JoystickActionAlign.TOP_RIGHT,
          ),
        ],
        keyboardConfig: KeyboardConfig(
          acceptedKeys: [
            // LogicalKeyboardKey.keyF,
            LogicalKeyboardKey.keyA,
            // LogicalKeyboardKey.keyS,
            LogicalKeyboardKey.keyD,
            // LogicalKeyboardKey.keyX,
          ],
          // keyboardDirectionalType: KeyboardDirectionalType.wasd,
        ),
      ),
      overlayBuilderMap: {
        // PlayerInterface.overlayKey: (context, game) => PlayerInterface(
        //       game: game,
        //     ),
        'stage1': (context, game) => ModulePlayerUi(
              controller: PlayerUiControler(game: game),
            ),
      },
      initialActiveOverlays: const [PlayerUiControler.overlayKey],
      progress: getLoaderStage(
        width: context.percentS(0.3),
        height: context.percentS(0.3),
      ),
    );
  }
}
