import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;
  static Dio? get dio => _dio;

  static intDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.sampleapis.com/coffee/',
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      ),
    );
  }
}
