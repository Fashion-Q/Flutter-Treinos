import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => NewTask();
}

class NewTask extends State<AddTask> {
  bool urlTrue = false;
  TextEditingController url = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    url.dispose();
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add a Task!"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              height: size.height,
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
                              child: Text("Name:"),
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 22),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-z,A-Z, ]'))
                                  ],
                                  maxLength: 20,
                                  decoration: formDecoration(),
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
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: formDecoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 26, top: 18),
                              child: Text("Url:"),
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  onChanged: (value){
                                    setState(() {
                                      
                                    });
                                  },
                                  controller: url,
                                  keyboardType: TextInputType.url,
                                  decoration: formDecoration(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width * 0.2,
                          height: (size.width * 0.2) * 1.25,
                          color: const Color.fromARGB(151, 156, 149, 252),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(url.text, fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                  "assets/imagens/lv_up/nophoto.png");
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: ElevatedButton(
                            onPressed: (){},
                            child: const Text("Salvar"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
