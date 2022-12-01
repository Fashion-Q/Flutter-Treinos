import 'package:flutter/material.dart';
import 'package:gambiarra/cep/modelo_cep.dart';

class CepComponentes {
  Icon getIconFavorit(int transparent, int red, int green, int blue) {
    //255, 0, 200, 277
    return Icon(
      Icons.favorite,
      color: Color.fromARGB(transparent, red, green, blue),
    );
  }

  TextStyle getTextStyleMain() {
    return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(-1.0, -1.0),
            blurRadius: 0.5,
            color: Color.fromARGB(255, 227, 19, 255),
          ),
        ]);
  }

  Image getImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  Widget getImageBackGround(double height, String path) {
    return SizedBox(
        height: height,
        child: Image.asset(
          path,
          fit: BoxFit.fill,
        ));
  }

  Widget getAppBar() {
    return AppBar(
      title: const Text(
        "Busque um CEP do Brasil!",
      ),
      titleTextStyle: getTextStyleMain(),
      centerTitle: true,
    );
  }

  Widget getDrawer(Size size) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 78, 78, 78),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: 
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ClipOval(child: Image.asset("image/4.jpeg"),),
                ),
            accountName: const Text("Verenilson da Silva Souza"),
            accountEmail: const Text("Vulgo Verelindo UwU")),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8,left: 8),
                  child: SizedBox(
                    child: Image.asset(
                      "image/d3.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                const Text("profeta.garoto@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2,right: 3),
                  child: SizedBox(
                    child: Image.asset(
                      "image/d1.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const Text("79 9 9629-1292",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: SizedBox(
                    child: Image.asset(
                      "image/d2.png",
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
                const Text("instagram.com/verelindo/",
                style: TextStyle(
                  color: Colors.white,
                ),),
              ],
            ),
            SizedBox(
              width: size.width * 0.7,
              height: size.height * 0.3,
              child: const Center(
                child: Text(
                  "O fantástico da vida é estar com alguém que saiba fazer de um pequeno instante, um grande momento!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Raleway",
                  ),),
              ),
            ),
        ],
      ),
    );
  }

  Widget getFakeAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Image.asset(
            "image/4.jpg",
            width: 70,
            height: 70,
          ),
        ),
        Text(
          "instagram.com/verelindo/",
          style: getTextStyleMain(),
        ),
        SizedBox(
          child: getIconFavorit(255, 0, 200, 277),
        ),
      ],
    );
  }

  Widget getElevatedButton(String nome) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          backgroundColor: const Color.fromARGB(255, 29, 214, 220),
          foregroundColor: Colors.black,
        ),
        child: Text(nome));
  }

  InputDecoration getTextFieldDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 29, 214, 220),
        labelText: "Ex: 49504450",
        labelStyle: const TextStyle(
          color: Color.fromARGB(249, 0, 0, 0),
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
        ),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        hintMaxLines: 8,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.solid,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 37, 14, 241),
            width: 3.0,
          ),
        ));
  }

  InputDecoration getTextFieldDecorationForm() {
    return InputDecoration(
      filled: true,
      enabled: false,
      fillColor: const Color.fromARGB(238, 202, 202, 202),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget getRow(Size size, ModeloCep modelo, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 0.4 * size.width,
          height: 80,
          child: TextField(
            controller: modelo.fixoCEP[index],
            textAlign: TextAlign.end,
            decoration: getTextFieldDecorationForm(),
          ),
        ),
        SizedBox(
          width: 0.5 * size.width,
          height: 80,
          child: TextField(
            controller: modelo.novoCEP[index],
            decoration: getTextFieldDecorationForm(),
          ),
        ),
      ],
    );
  }
}
