import 'package:flutter/material.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/feature/recarga/controller/controller_recarga.dart';
import 'package:treinos/appbrazfailure/feature/recarga/widgets/card_recarga.dart';
import 'package:treinos/appbrazfailure/utils/failures/failures.dart';
import 'package:dartz/dartz.dart' as dartz;

class RecargaPage extends StatefulWidget {
  const RecargaPage({super.key, required this.controller});
  final RecargaController controller;

  @override
  State<RecargaPage> createState() => _RecargaPageState();
}

class _RecargaPageState extends State<RecargaPage> {
  late Future _getProducts;
  @override
  void initState() {
    _getProducts = widget.controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Treino"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              FutureBuilder(
                future: _getProducts,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    dartz.Either<Failure, List<ProdutosModel>> either = snapshot
                        .data as dartz.Either<Failure, List<ProdutosModel>>;

                    return either.fold(
                      (l) => Center(
                        child: Text(l.message),
                      ),
                      (r) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        shrinkWrap: true,
                        itemCount: r.length,
                        itemBuilder: (context, index) => CardRecarga(
                            produtosModel: r[index],
                            recargaController: widget.controller),
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint(_getProducts.toString());
                },
                child: const Text("data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
