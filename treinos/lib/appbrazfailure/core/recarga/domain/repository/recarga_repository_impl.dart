import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/datasource/recarga_remote_datasource.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/pix_qr_model.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/model/products.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/repository/recarga_repository_interface.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/entity/recarga_escolhas_entity.dart';
import 'package:treinos/appbrazfailure/utils/failures/failures.dart';

class RecargaRepositoryImpl extends IRecargaRepository {
  final IRecargaRemoteDataSource recargaRemoteDataSource;
  RecargaRepositoryImpl({required this.recargaRemoteDataSource});

  @override
  Future<Either<Failure, PixQrModel>> getPixQr(
      {required RecargaEscolhasEntity recargaEscolhasEntity}) async {
    try {
      final result = await recargaRemoteDataSource.getPixQr(
          recargaEscolhasEntity: recargaEscolhasEntity);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure("${e.toString()} Erro Desconhecido"));
    }
  }

  @override
  Future<Either<Failure, List<ProdutosModel>>> getProducts() async{
    try{
      final result = await recargaRemoteDataSource.getProducts();
      return Right(result);
    } on Exception catch(e){
      return Left(Failure("${e.toString()} Erro Desconhecido"));
    }
  }
}
