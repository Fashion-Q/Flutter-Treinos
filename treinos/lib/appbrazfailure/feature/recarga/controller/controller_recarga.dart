import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/pix_qr_model.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/entity/recarga_escolhas_entity.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/usecase/recarga_usecase.dart';
import 'package:treinos/appbrazfailure/utils/failures/failures.dart';

class RecargaController extends ChangeNotifier {
  final RecargaUseCase recargaUseCase;
  RecargaController({required this.recargaUseCase});
  ProdutosModel? selectedProduct;

  Future<Either<Failure, List<ProdutosModel>>> getProducts() async {
    return await recargaUseCase.getProducts();
  }

  void selectProduct(ProdutosModel produtosModel) {
    selectedProduct = produtosModel;
    notifyListeners();
  }

  Future<Either<Failure, PixQrModel>> getPayment(String phone) async {
    return await recargaUseCase.getPixQr(
        recargaEscolhasEntity: RecargaEscolhasEntity(
            telefone: phone,
            valor: selectedProduct!.minimumAmount,
            idProduto: selectedProduct!.id));
  }
}
