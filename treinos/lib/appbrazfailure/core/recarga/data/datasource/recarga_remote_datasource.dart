import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/pix_qr_model.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/entity/recarga_escolhas_entity.dart';

abstract class IRecargaRemoteDataSource {
  Future<List<ProdutosModel>> getProducts();

  Future<PixQrModel> getPixQr(
      {required RecargaEscolhasEntity recargaEscolhasEntity});
}

class RecargaRemoteDataSourcecImpl extends IRecargaRemoteDataSource {
  final Dio dio;
  RecargaRemoteDataSourcecImpl({required this.dio});
  @override
  Future<PixQrModel> getPixQr(
      {required RecargaEscolhasEntity recargaEscolhasEntity}) async {
    try {
      Response res = await dio.post(
        "/createRecharge",
        data: recargaEscolhasEntity.toJson(),
      );
      return PixQrModel.fromJson(res.data);
    } on DioException catch (e) {
      log(e.message ?? "Erro desconhecido");
      rethrow;
    }
  }

  @override
  Future<List<ProdutosModel>> getProducts() async {
    try {
      Response res = await dio.get("/getProducts");
      List<ProdutosModel> p = (res.data as List<dynamic>)
          .map((e) => ProdutosModel.fromJson(e))
          .toList();
      return p;
    } on DioException catch (e) {
      log(e.message ?? "Erro desconhecido");
      rethrow;
    }
  }
}
