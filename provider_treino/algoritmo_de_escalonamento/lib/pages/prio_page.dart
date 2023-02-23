import 'package:algoritmo_de_escalonamento/controller/prioridade_controller.dart';
import 'package:algoritmo_de_escalonamento/share/box_decoration.dart';
import 'package:algoritmo_de_escalonamento/share/text_style.dart';
import 'package:flutter/material.dart';
//import 'dart:developer';

class Prioridade extends StatelessWidget {
  const Prioridade({super.key, required this.controller});
  final PrioridadeController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(10),
      decoration: boxDecorationAll(
          radius: 16, color: const Color.fromARGB(82, 6, 232, 191)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: size.width,
              height: 40,
              decoration:
                  boxDecorationTopRightLeft(radius: 16, color: Colors.blue),
              alignment: Alignment.center,
              child: const Text(
                "Algoritimo de Prioridade",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: controller.fixHeightInfoTable(),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: boxDecorationTopRightLeft(
              radius: 8,
              color: Colors.amber,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: controller.infoTable,
            ),
          ),
          Container(
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Tempo de chegada até: X = ${controller.x.toStringAsFixed(2)}",
                    style: primaryStyle(size: 22),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: controller.fixHeightTableChegada(),
                  child: ListView(
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                    children: controller.widgetsTableChegada,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: 70,
              decoration: boxDecorationTopRightLeft(
                radius: 16,
                color: Colors.grey,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 60,
                    decoration:
                        boxDecorationTopLeft(radius: 16, color: Colors.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Fila",
                          style: primaryStyle(size: 30),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: controller.taskLook.isNotEmpty
                        ? controller.taskLook
                        : <Widget>[],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width,
            color: Colors.blue,
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Text(
                  "Em execução: ",
                  style: primaryStyle(size: 22, color: Colors.white),
                ),
                controller.widgetTaskEmExecucao(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 101,
            margin: const EdgeInsets.only(bottom: 15),
            color: const Color.fromARGB(72, 0, 150, 135),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Text(
                        "Tempo de Animação: ${controller.timeAnimacao}",
                        style: primaryStyle(size: 22, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: controller.columnRowEscalonamento,
                        ),
                        Column(
                          children: [
                            Text(
                              "X",
                              style: primaryStyle(size: 16),
                            ),
                            Text(
                              controller.escalonamentoX.toStringAsFixed(2),
                              style: primaryStyle(size: 16),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          //const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.tempoAnimacaoDescrementa,
                child: const Icon(
                  Icons.keyboard_double_arrow_left,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: controller.escalonamentoX != controller.x ? controller.playOrPauseButton : null,
                  child: Icon(
                    controller.playButton ? Icons.pause : Icons.play_arrow,
                    size: 30,
                  ),
                ),
              ), //Icons.pause
              ElevatedButton(
                onPressed: controller.tempoAnimacaoIncrementa,
                child: const Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: ElevatedButton(
              onPressed: controller.reset ? controller.resetarTudo : null,
              child: const Icon(Icons.restart_alt,size: 30,),
            ),
          ),
        ],
      ),
    );
  }
}
