import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../endpoints.dart';

class AppInterceptors extends Interceptor {
  final Dio? dio;

  AppInterceptors({
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("request is sending");
    debugPrint("REQUEST[${options.method}] => PATH: $baseUrl${options.path}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint("response is getting");
    if (response.statusCode == 401) {}
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(err.error.toString());
    String? error = err.response?.data['meta']['message'] ?? "wrong_request";
    return handler.next(
      DioException(
        requestOptions: err.requestOptions,
        message: error!.tr,
      ),
    );
  }
}
