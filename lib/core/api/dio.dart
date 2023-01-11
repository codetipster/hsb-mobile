import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';

class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: 'https://hsb-backend-app.onrender.com/api',
      contentType: 'application/json',
      headers: {"Accept": "*/*"},
      connectTimeout: 10000,
      sendTimeout: 10000,
      receiveTimeout: 10000,
    );

    this.options = options;

    if (kDebugMode) {
      interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
