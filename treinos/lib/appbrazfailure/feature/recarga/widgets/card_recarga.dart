import 'package:flutter/material.dart';
import 'package:treinos/appbrazfailure/feature/recarga/controller/controller_recarga.dart';
import '../../../core/recarga/data/model/products.dart';

class CardRecarga extends StatelessWidget {
  final ProdutosModel produtosModel;
  final RecargaController recargaController;

  const CardRecarga(
      {Key? key, required this.produtosModel, required this.recargaController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: recargaController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => recargaController.selectProduct(produtosModel),
          child: Card(
            shape: recargaController.selectedProduct != null &&
                    recargaController.selectedProduct == produtosModel
                ? RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(250, 15, 28, 122),
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  )
                : null,
            child: Center(
              child: Text(
                produtosModel.name.replaceFirst('VIVO', 'BRAZMOVEL\n'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
