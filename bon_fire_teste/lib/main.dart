import 'package:bon_fire_teste/decoration/chess.dart';
import 'package:bon_fire_teste/decoration/lighting.dart';
import 'package:bon_fire_teste/decoration/mushroom.dart';
import 'package:bon_fire_teste/globals.dart';
import 'package:bon_fire_teste/interface/interface2.dart';
//import 'package:bon_fire_teste/interface/player_interface.dart';
import 'package:bon_fire_teste/monstro/orc.dart';
import 'package:bon_fire_teste/personagem/personagem.dart';
import 'package:bon_fire_teste/testes/rena.dart';
// import 'package:bon_fire_teste/ui/helpers/helper_page.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:desktop_window/desktop_window.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  // WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setWindowSize(const Size(600, 380));
  // await DesktopWindow.setMinWindowSize(const Size(600, 380));
  // await DesktopWindow.setMaxWindowSize(const Size(600, 380));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estou Testando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHelperWidget(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> implements GameListener {
  static Function? setStateMaster;
  bool joysticBool = false;

  late GameController gameController;

  @override
  void initState() {
    setStateMaster = justNoti;
    gameController = GameController()..addListener(this);
    super.initState();
  }

  void justNoti() {
    joysticBool = !joysticBool;
    debugPrint("NotifierBool = $joysticBool");
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      gameController: gameController,
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
          'lighting': (properties) => LightingDecoration(
                properties.position,
              ),
          'rena': (properties) => Rena(
                properties.position,
              ),
          'chess': (properties) => Chess(
                properties.position,
              ),
          'mushroom': (properties) => Mushroom(
                properties.position,
              ),
        },
      ),
      // components: [
      //   Orc(
      //     Vector2(3 * tileSize, 6 * tileSize),
      //   ),
      // ],
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.purple,
          margin: const EdgeInsets.only(left: 85, bottom: 85),
          size: 120,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orangeAccent,
            margin: const EdgeInsets.only(right: 20, bottom: 30),
            size: 80,
          ),
        ],
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasd,
        ),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: false,
        zoom: 1.5,
        //sizeMovementWindow: Vector2(tileSize * 4,tileSize * 4),
      ),
      overlayBuilderMap: {
        // PlayerInterface.overlayKey: (context, game) => PlayerInterface(
        //       game: game,
        //     ),
        'interface2': (context, game) => Interface2(
              game: game,
            ),
      },
      initialActiveOverlays: const [Interface2.overlayKey],
      // initialActiveOverlays: const [PlayerInterface.overlayKey],
    );
  }

  bool canAddEnemiesAgain = true;

  @override
  void changeCountLiveEnemies(int count) {
    if (count == 0) {
      if (canAddEnemiesAgain) {
        canAddEnemiesAgain = false;
        Future.delayed(
          const Duration(milliseconds: 4000),
          () {
            List<int> x = [11, 5, 16, 23, 20];
            List<int> y = [6, 13, 8, 13, 3];
            for (int i = 0; i < 5; i++) {
              gameController.gameRef.add(
                Orc(
                  Vector2(x[i] * tileSize, y[i] * tileSize),
                ),
              );
            }
            gameController.gameRef.add(
              Rena(
                Vector2(
                  142,
                  206,
                ),
              ),
            );
            canAddEnemiesAgain = true;
          },
        );
      }
    }
  }

  @override
  void updateGame() {}
}
