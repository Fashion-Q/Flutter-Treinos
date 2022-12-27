import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../repository/repository.dart';

/// As chaves são chamadas de "levelN"
/// Ex: level10
/// É como se fosse "tarefa10"

class AddTask extends StatefulWidget {
  const AddTask(
      {super.key, required this.repository, required this.controllerNotifier});
  final Function controllerNotifier;
  final Repository repository;

  @override
  State<AddTask> createState() => NewTask();
}

class NewTask extends State<AddTask> {
  bool urlValidate = false;
  bool clickButtonUrl = true;
  bool salvarTarefa = false;
  bool levelDalidate = false;

  final TextEditingController nome = TextEditingController();
  final TextEditingController level = TextEditingController();
  final TextEditingController url = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validarNome(String? texto) {
    if (texto == null) {
      return false;
    }
    int contSpace = 0;
    for (int i = 0; i < texto.length; i++) {
      if (texto[i] == ' ') {
        contSpace++;
      }
    }
    if (texto.length - contSpace < 3) {
      return false;
    }
    return true;
  }

  bool validarLevel(String? texto) {
    if (texto == null || texto.isEmpty) {
      return false;
    }
    if (int.parse(texto) < 1 || int.parse(texto) > 10) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    url.dispose();
    nome.dispose();
    level.dispose();
  }

  InputDecoration formDecoration() {
    return const InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Adicionar uma nova tarefa!"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
                width: size.width,
                color: const Color.fromARGB(61, 244, 67, 54),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.9,
                      color: const Color.fromARGB(137, 76, 175, 79),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Text("Nome:"),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: 110,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: TextFormField(
                                    onChanged: (String? t) {
                                      if (salvarTarefa) {
                                        setState(() {
                                          salvarTarefa = false;
                                        });
                                      }
                                    },
                                    controller: nome,
                                    keyboardType: TextInputType.name,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          '[a-z,A-Z,0-9,@,!,\$,%,&,*,-, ]'))
                                    ],
                                    maxLength: 20,
                                    decoration: formDecoration(),
                                    validator: (String? texto) {
                                      if (!validarNome(texto)) {
                                        return "O nome precisa ser maior que 2!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Text("Level:"),
                              ),
                              SizedBox(
                                width: 50,
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: TextFormField(
                                    onChanged: (String? t) {
                                      if (salvarTarefa) {
                                        setState(() {
                                          salvarTarefa = false;
                                        });
                                      }
                                    },
                                    controller: level,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: formDecoration(),
                                    validator: (String? texto) {
                                      if (!validarLevel(texto)) {
                                        setState(() {
                                          levelDalidate = true;
                                        });
                                        return " ";
                                      }
                                      setState(() {
                                        levelDalidate = false;
                                      });
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: levelDalidate,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                      "O level precisa estar entre 1 e 10!",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 211, 47, 47),
                                          fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 26, top: 12),
                                child: Text("Url:"),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: 110,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: TextFormField(
                                    onChanged: (String? t) {
                                      if (salvarTarefa) {
                                        setState(() {
                                          salvarTarefa = false;
                                        });
                                      }
                                    },
                                    controller: url,
                                    keyboardType: TextInputType.url,
                                    decoration: formDecoration(),
                                    validator: (String? texto) {
                                      if (!urlValidate) {
                                        return "Insira um url de imagem válida!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.network(url.text,
                              width: size.width * 0.8, fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget image,
                                  ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              urlValidate = true;
                              return image;
                            }
                            urlValidate = false;
                            return SizedBox(
                              width: size.width * 0.2,
                              height: (size.width * 0.2) / 1.25,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          }, errorBuilder: (_, __, ___) {
                            urlValidate = false;
                            return Container(
                              width: size.width * 0.2,
                              height: (size.width * 0.2) * 1.25,
                              color: const Color.fromARGB(151, 156, 149, 252),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  "assets/imagens/lv_up/nophoto.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (clickButtonUrl) {
                                  clickButtonUrl = false;
                                  for (int i = 0; i < 10; i++) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    setState(() {
                                      urlValidate ? i = 10 : i = i;
                                    });
                                  }
                                  clickButtonUrl = true;
                                  if (formKey.currentState!.validate()) {
                                    salvarTarefa = true;
                                  }
                                }
                              },
                              child: const Text("Carregar Informações"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: salvarTarefa
                                    ? Colors.blue
                                    : const Color.fromARGB(240, 129, 128, 128),
                              ),
                              onPressed: () async {
                                if (salvarTarefa) {
                                  salvarTarefa = false;
                                  int index = await widget.repository
                                      .loadIndex("level");
                                  index++;

                                  if (await widget.repository.saveJson({
                                    "id": index.toString(),
                                    "nome": nome.text,
                                    "level": level.text,
                                    "url": url.text,
                                    "progress": "0.0",
                                    "indexProgress": "0",
                                  }, "level$index")) {
                                    await widget.repository
                                        .saveInt(index, "level");
                                  }
                                  await widget.controllerNotifier();
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Tarefa adicionada: ${nome.text}",
                                    textAlign: TextAlign.center,
                                  )));
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text("Salvar Tarefa"),
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.08,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          )),
    );
  }
}
