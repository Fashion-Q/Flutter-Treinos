import 'package:bonfire/bonfire.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:castle_way/game/game.dart';
import 'package:castle_way/repository/mapa_world.dart';
import 'package:castle_way/share/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //44444444444444444444444444444444444444444444444444444444444
  // WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setWindowSize(const Size(600, 350));
  // await DesktopWindow.setMinWindowSize(const Size(600, 350));
  // await DesktopWindow.setMaxWindowSize(const Size(600, 350));

  RepositoryMapWorld repository = RepositoryMapWorld();
  Map<String, dynamic> currentStage = await repository.loadCurrentStage();
  // Map<String, dynamic>? currentStage = {};
  Vector2? playerInitPosition;
  if (currentStage.isEmpty) {
    await setGameMap();
    currentStage = await repository.loadCurrentStage();
  }
  List<dynamic>? posit = currentStage['playerNext'];
  posit ??= currentStage['playerReturn'];
  playerInitPosition = Vector2(double.parse(posit![0].toString()) * tiledSize,
      double.parse(posit[1].toString()) * tiledSize);
  runApp(MyApp(
    currentStage: currentStage,
    playerInitPosition: playerInitPosition,
  ));
}

Future<void> setGameMap() async {
  Map<String, dynamic> stage1 = {
    'tiled': 'maps/stage1/stage1_main.json',
    'playerNext': [12, 1],
    'playerReturn': [3, 12],
    'teleportXY': [],
  };

  Map<String, dynamic> stage2 = {
    'tiled': 'maps/stage1/stage2_main.json',
    'playerNext': [83, 21],
    'playerReturn': [9, 53],
    'teleportXY': [7, 53],
  };

  Map<String, Map<String, dynamic>> mapa = {};
  mapa['stage1'] = stage1;
  mapa['stage2'] = stage2;
  RepositoryMapWorld mapWorld = RepositoryMapWorld();
  await mapWorld.setGameMap(mapa);

  mapa = {};
  mapa = await mapWorld.getGameMap();
  stage1.remove('playerReturn');
  await mapWorld.saveCurrentStage(stage1);
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.currentStage,
      required this.playerInitPosition});
  final Map<String, dynamic> currentStage;
  final Vector2 playerInitPosition;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Castle Way',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameMaster(
        currentStage: currentStage,
        playerInitPosition: playerInitPosition,
      ),
    );
  }
}
