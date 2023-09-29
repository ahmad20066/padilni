import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:padilni/data/endpoints.dart';

import '../local/shared.dart';

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
    if (response.statusCode == 401) {
      debugPrint("hello from 401");

      await Shared.clear();
    }
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("error is occur");
    print(err.error);
    print(err.message);
    if (err.error is SocketException) {
      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          message: 'no_internet'.tr,
        ),
      );
    } else if (err.response?.statusCode == 401) {
      // Get.offAll(() => LogInScreen());
      Get.snackbar("sorry".tr, "re_login".tr);
      await Shared.deleteString("token");
    } else if (err.response?.statusCode == 422) {
      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          message: err.response?.data['message'],
        ),
      );
    } else if (err.response?.statusCode == 403) {
      return handler.next(err);
    } else {
      return handler.next(
        DioException(
          requestOptions: err.requestOptions,
          message: 'wrong_request'.tr,
        ),
      );
    }
  }
}
