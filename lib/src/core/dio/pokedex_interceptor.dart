import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final class PokedexDioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(options.data.toString());

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    debugPrint('ERROR:${err.message}');
    super.onError(err, handler);
  }
}
