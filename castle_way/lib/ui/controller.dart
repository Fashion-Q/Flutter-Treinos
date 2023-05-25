import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:castle_way/share/widgets.dart';

class PlayerUiControler extends ChangeNotifier with HelperWidget {
  final BonfireGame game;

  static const overlayKey = "stage1";

  final List<Widget> _life = [];
  List<Widget> get life => _life;

  PlayerUiControler({required this.game}) {
    for (int i = 0; i < 5; i++) {
      _life.add(favoritIcon(1));
    }
  }

  bool _canRemoveLife = true;

  void removeLife(int n) async {
    if (_canRemoveLife) {
      _canRemoveLife = false;
      int lenght = _life.length;
      for (int i = 0; i < 24; i++) {
        for (int j = n; j > 0; j--) {
          if ((lenght - j) >= 0) {
            _life[lenght - j] = favoritIcon(i % 2 == 0 ? 0.0 : 1.0);
          }
        }
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 150));
      }
      _canRemoveLife = true;
    }
  }

  bool test = true;
  void teste() async {
    removeLife(5);

  }

  int count = 0;
}
