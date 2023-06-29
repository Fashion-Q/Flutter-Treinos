import 'package:dio/dio.dart';
import 'package:treinos/appbrazfailure/core/auth/data/datasource/auth_local_datasource.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      const sessionService = AuthLocalDataSourrceImpl();
      final user = await sessionService.getCurrentUser();
      options.headers['Authorization'] = 'Bearer ${user.token}';
      return super.onRequest(options, handler);
    } catch (e) {
      return super.onRequest(options, handler);
    }
  }
}
