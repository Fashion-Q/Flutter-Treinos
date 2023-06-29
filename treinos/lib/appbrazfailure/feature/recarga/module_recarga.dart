import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/datasource/recarga_remote_datasource.dart';
import 'package:treinos/appbrazfailure/core/recarga/data/repository/recarga_repository_interface.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/repository/recarga_repository_impl.dart';
import 'package:treinos/appbrazfailure/core/recarga/domain/usecase/recarga_usecase.dart';
import 'package:treinos/appbrazfailure/feature/recarga/controller/controller_recarga.dart';
import 'package:treinos/appbrazfailure/feature/recarga/page/page_recarga.dart';

class ModuleRecarga extends StatefulWidget {
  const ModuleRecarga({super.key});

  @override
  State<ModuleRecarga> createState() => BrazLeftRight();
}

class BrazLeftRight extends State<ModuleRecarga> {
  late final RecargaController _controller;
  late final Dio dio;
  @override
  void initState() {
    super.initState();
    dio = Dio();
    dio.options.baseUrl = "https://braz.ittv.com.br/portal";
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseBody: true,
    //       responseHeader: true,
    //       error: true,
    //       compact: true,
    //       maxWidth: 90),
    // );
    IRecargaRemoteDataSource r = RecargaRemoteDataSourcecImpl(dio: dio);
    IRecargaRepository rep = RecargaRepositoryImpl(recargaRemoteDataSource: r);
    RecargaUseCase recargaUseCase = RecargaUseCase(recargaRepository: rep);
    _controller = RecargaController(recargaUseCase: recargaUseCase);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => RecargaPage(
        controller: _controller,
      ),
    );
  }
}
