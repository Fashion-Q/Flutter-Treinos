import 'package:flutter/material.dart';
import 'package:simulation/root_page/root_controller.dart';

class RootComponentes {
  Widget getDrawer(Size size) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 78, 78, 78),
      child: Column(
        children: [
          //C:\dev\Flutter\Flutter-Treinos\simulation\assets\imagens\cep
          UserAccountsDrawerHeader(
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ClipOval(
                  child: Image.asset("assets/imagens/home/4.jpeg"),
                ),
              ),
              accountName: const Text("Verenilson da Silva Souza"),
              accountEmail: const Text("Vulgo Verelindo UwU")),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: SizedBox(
                  child: Image.asset(
                    "assets/imagens/home/d3.png",
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              const Text(
                "profeta.garoto@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 3),
                child: SizedBox(
                  child: Image.asset(
                    "assets/imagens/home/d1.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              const Text(
                "79 9 9629-1292",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  child: Image.asset(
                    "assets/imagens/home/d2.png",
                    width: 45,
                    height: 45,
                  ),
                ),
              ),
              const Text(
                "instagram.com/verelindo/",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: size.width * 0.7,
              child: const Text(
                "O fantástico da vida é estar com alguém que saiba fazer de um pequeno instante, um grande momento!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "RalewayNormal",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: const Text("Simulation"),
      centerTitle: true,
      actions: [
        Switch(
          value: RootController.controller.boolDarkTheme,
          onChanged: (value) {
            RootController.controller.changeTheme();
          },
          inactiveThumbColor: const Color.fromARGB(255, 32, 255, 54),
          inactiveTrackColor: const Color.fromARGB(138, 32, 255, 54),
        ),
      ],
    );
  }
}
