import 'package:flutter/material.dart';
import 'package:simulation/repository/repository.dart';

class MyTask extends StatefulWidget {
  final int id;
  final String nome;
  final int lv;
  final String url;
  final double progress;
  final int indexProgress;
  final Repository repository;
  const MyTask(
      {required this.repository,
      required this.id,
      required this.nome,
      required this.lv,
      required this.url,
      required this.progress,
      required this.indexProgress,
      super.key});

  @override
  State<MyTask> createState() => Task();
}

class Task extends State<MyTask> {
  late double progress = widget.progress;
  late int indexProgress = widget.indexProgress;
  late List<Widget> star = [];
  bool salvarTarefa = false;
  bool uparTarefa = true;
  bool deletarTarefa = true;
  Color colorDel = Colors.blue;

  List<BoxDecoration> decoration = [
    const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(128, 0, 255, 72),
      Color.fromARGB(154, 13, 252, 25),
      Color.fromARGB(255, 71, 255, 4),
    ])),
    const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 119, 143, 1),
      Color.fromARGB(185, 230, 255, 6),
      Color.fromARGB(255, 247, 255, 10),
    ])),
    const BoxDecoration(
        gradient: LinearGradient(colors: [
      Colors.blue,
      Colors.purple,
      Colors.red,
    ])),
  ];

  double checkLv() {
    return progress / widget.lv / (2 * widget.lv * (indexProgress + 1) * 5);
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      star.add(Icon(
        Icons.star,
        color: widget.lv > i ? Colors.blue : Colors.blue[100],
        size: 15,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: size.width * 0.95,
            //Color.fromARGB(70, 141, 181, 255)
            decoration: const BoxDecoration(
              color: Color.fromARGB(70, 205, 144, 31),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.3,
                  height: (size.width * 0.3) * 1.25,
                  color: const Color.fromARGB(255, 233, 233, 233),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(widget.url, fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                        return Image.asset("assets/imagens/lv_up/nophoto.png");
                      })),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          widget.nome,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              overflow: TextOverflow.fade, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: star,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.15,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            uparTarefa
                                ? Colors.blue
                                : const Color.fromARGB(240, 129, 128, 128),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          if (uparTarefa) {
                            colorDel = Colors.blue;
                            salvarTarefa = true;

                            if (checkLv() < 1.0) {
                              progress++;
                            } else if (indexProgress < 2) {
                              indexProgress++;
                              progress = 0;
                            } else if (indexProgress == 2) {
                              //fazer animação pq ja ta todo upadasso
                              uparTarefa = false;
                            }
                            setState(() {});
                          }
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text("up"),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (salvarTarefa) {
                            colorDel = Colors.blue;
                            await widget.repository.saveJson({
                              "id": widget.id.toString(),
                              "nome": widget.nome,
                              "level": widget.lv.toString(),
                              "url": widget.url,
                              "progress": progress.toString(),
                              "indexProgress": indexProgress.toString()
                            }, "level${widget.id}");
                            setState(() {
                              salvarTarefa = false;
                            });
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            salvarTarefa
                                ? Colors.green
                                : const Color.fromARGB(240, 129, 128, 128),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text("save"),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            colorDel,
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () async {
                          if (deletarTarefa) {
                            colorDel == Colors.blue
                                ? colorDel = Colors.red
                                : colorDel =
                                    const Color.fromARGB(240, 129, 128, 128);

                            if (colorDel ==
                                const Color.fromARGB(240, 129, 128, 128)) {
                              salvarTarefa = false;
                              uparTarefa = false;
                              deletarTarefa = false;
                              await widget.repository
                                  .saveJson({"id": "-1"}, "level${widget.id}");
                            }
                            setState(() {});
                          }
                        },
                        child: const Text("Del"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: decoration[indexProgress],
            width: size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: checkLv(),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                  child: Text("Nível: $progress"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
