import 'package:dartz/dartz.dart';
import 'package:treinos/appbrazfailure/utils/failures/failures.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/entity/recarga_escolhas_entity.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/pix_qr_model.dart';

abstract class IRecargaRepository {
  Future<Either<Failure, List<ProdutosModel>>> getProducts();
  Future<Either<Failure, PixQrModel>> getPixQr(
      {required RecargaEscolhasEntity recargaEscolhasEntity});
}
