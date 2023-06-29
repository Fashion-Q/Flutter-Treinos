import 'package:dio/dio.dart';
import 'package:treinos/appbrazfailure/utils/network/interceptors/auth_interceptor.dart';

class DioAuthed {
  static final DioAuthed _singleton = DioAuthed._internal();

  final Dio dio = Dio()
    ..interceptors.addAll([
      AuthInterceptor(),
    ]);

  factory DioAuthed() {
    return _singleton;
  }

  DioAuthed._internal();
}
