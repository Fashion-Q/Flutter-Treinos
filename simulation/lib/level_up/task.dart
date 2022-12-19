import 'package:flutter/material.dart';

class MyTask extends StatefulWidget {
  final String nome;
  final int lv;
  final String url;
  const MyTask(
      {required this.nome, required this.lv, required this.url, super.key});

  @override
  State<MyTask> createState() => Task();
}

class Task extends State<MyTask> {
  double progress = 0;
  int indexProgress = 0;
  List<Widget> star = [];
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
            width: size.width * 0.9,
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
                  width: size.width * 0.2,
                  height: (size.width * 0.2) * 1.25,
                  color: const Color.fromARGB(255, 233, 233, 233),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(widget.url, fit: BoxFit.cover,
                          errorBuilder: (BuildContext context,Object error,StackTrace? stackTrace) {
                        return Image.asset(
                            "assets/imagens/lv_up/nophoto.png");
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
                                overflow: TextOverflow.ellipsis,fontSize: 20),
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
                    )),
                SizedBox(
                  width: size.width * 0.15,
                  child: ElevatedButton(
                    onPressed: () {
                      if (progress /
                              widget.lv /
                              (2 * widget.lv * ((indexProgress + 1) * 5)) <
                          1.0) {
                        progress++;
                        setState(() {});
                      } else if (indexProgress < 2) {
                        indexProgress++;
                        progress = 0;
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
                ),
              ],
            ),
          ),
          Container(
            decoration: decoration[indexProgress],
            width: size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: progress /
                        widget.lv /
                        (2 * widget.lv * ((indexProgress + 1) * 5)),
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
