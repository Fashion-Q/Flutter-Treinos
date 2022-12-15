import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cep_components.dart';
import 'cep_model.dart';

class Cep extends StatefulWidget {
  const Cep({super.key});

  @override
  State<Cep> createState() => _CepState();
}

class _CepState extends State<Cep> {
  final CepComponentes cepComponentes = CepComponentes();
  final ModelCep modelo = ModelCep();
  bool loadingProgress = false;
  bool boolButton = true;
  bool okCep = false;

  String? cep;
  String snackBar = "";

  @override
  void dispose() {
    super.dispose();
    //precisa tirar da memoria os TextEditingController quando finalizar o app
    for (int i = 0; i < modelo.newCep.length; i++) {
      modelo.newCep[i].dispose();
      modelo.constCep[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            cepComponentes.getImageBackGround(
                size.height,
                size.width < 450
                    ? "assets/imagens/cep/1.png"
                    : "assets/imagens/cep/2.png"),
            Column(
              children: [
                size.width < 450
                    ? cepComponentes.getAppBar()
                    : SizedBox(
                        width: 0,
                        height: size.height * 0.04,
                      ),
                size.width < 450
                    ? SizedBox(
                        height: size.height * 0.04,
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 80,
                      child: TextFormField(
                        onChanged: (value) {
                          cep = value;
                        },
                        decoration: cepComponentes.getTextFieldExemple(),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        autofocus: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                      height: 50,
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: Color.fromARGB(255, 29, 214, 220),
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (boolButton) {
                            boolButton = false;
                            if (cep != null && cep?.length == 8) {
                              setState(() {
                                loadingProgress = true;
                              });
                              snackBar = await modelo.changeCep(cep);
                              setState(() {
                                loadingProgress = false;
                              });
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                        snackBar,
                                        textAlign: TextAlign.center,)));
                              await Future.delayed(
                                  const Duration(milliseconds: 5000), () {
                                boolButton = true;
                              });
                            } else {
                              boolButton = false;
                              snackBar = "Insira 8 digitos!";
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                        snackBar,
                                        textAlign: TextAlign.center,)));
                              await Future.delayed(
                                  const Duration(milliseconds: 5000), () {
                                boolButton = true;
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          backgroundColor:
                              const Color.fromARGB(255, 29, 214, 220),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text("BUSCAR"),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: loadingProgress,
                  child: const CircularProgressIndicator(
                    color: Color.fromARGB(255, 54, 244, 117),
                    strokeWidth: 7,
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: 0.7 * size.height,
                  child: ListView.builder(
                    itemCount: modelo.constCep.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cepComponentes.getRowCep(size, modelo, index);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
