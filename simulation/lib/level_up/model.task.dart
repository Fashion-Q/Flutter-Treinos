import 'package:flutter/material.dart';

class ModelTask extends StatefulWidget {
  final String nome;
  final int lv;
  final String url;
  const ModelTask(
      {required this.nome, required this.lv, required this.url, super.key});

  Map<String, dynamic> toJson() => {"nome": nome, "lv": lv, "url": url};

  List<String> keyList() => ["nome", "lv", "url"];

  @override
  State<ModelTask> createState() => Task();
}

class Task extends State<ModelTask> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: Container(
        width: size.width,
        height: 150,
        color: Color.fromARGB(255, 233, 233, 233),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              height: 100,
              child: const Icon(Icons.add),
            ),
            SizedBox(
              width: size.width * 0.5,
              height: 100,
              child:  Text(widget.nome),
            ),
          ],
        ),
      ),
    );
  }
}
