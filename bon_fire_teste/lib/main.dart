import 'package:bon_fire_teste/globals.dart';
import 'package:bon_fire_teste/monstro/orc.dart';
import 'package:bon_fire_teste/personagem/personagem.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      player: Personagem(
        Vector2(1 * tileSize, 4 * tileSize),
      ),
      showCollisionArea: false,
      lightingColorGame: Colors.black.withOpacity(0.5),
      map: WorldMapByTiled(
        'maps/true_map.json',
        forceTileSize: Vector2(tileSize, tileSize),
        objectsBuilder: {
          'orc': (properties) => Orc(
                properties.position,
              ),
        },
      ),
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.purple,
          margin: const EdgeInsets.only(left: 70, bottom: 70),
          size: 80,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orangeAccent,
            margin: const EdgeInsets.only(right: 10, bottom: 20),
            size: 50,
          ),
        ],
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasd,
        ),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.5,
        //sizeMovementWindow: Vector2(tileSize * 4,tileSize * 4),
      ),
    );
  }
}
