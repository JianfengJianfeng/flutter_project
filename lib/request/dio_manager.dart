import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

class DioManager {
  late Dio _dio;

  DioManager._internal() {
    _dio = Dio();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  static DioManager singleton = DioManager._internal();

  factory DioManager() => singleton;

  get dio {
    return _dio;
  }
}