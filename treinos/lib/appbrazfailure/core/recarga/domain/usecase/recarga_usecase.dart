import 'package:dartz/dartz.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/pix_qr_model.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/repository/recarga_repository_interface.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/entity/recarga_escolhas_entity.dart';

import '../../../../utils/failures/failures.dart';

class RecargaUseCase {
  final IRecargaRepository recargaRepository;
  const RecargaUseCase({required this.recargaRepository});

  Future<Either<Failure, PixQrModel>> getPixQr(
      {required RecargaEscolhasEntity recargaEscolhasEntity}) async {
    final res = await recargaRepository.getPixQr(
        recargaEscolhasEntity: recargaEscolhasEntity);
    if (res.isLeft()) {
      //tratarErro
    }
    return res;
  }

  Future<Either<Failure, List<ProdutosModel>>> getProducts() async {
    final res = await recargaRepository.getProducts();
    if (res.isLeft()) {
      //tratar
    }
    return res;
  }
}
