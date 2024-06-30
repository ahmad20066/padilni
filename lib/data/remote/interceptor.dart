import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

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
    print(err.response);
    print(err.message);
    print(err.error);
    String? error = err.response?.data['message'] ?? "wrong_request";
    if (err.response?.statusCode == 401) {
      print("zzzz");
      if (Get.currentRoute != AppRoutes.login) {
        Shared.setstring("token", "");
        Get.offAllNamed(AppRoutes.login);

        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            message: "relogin",
          ),
        );
      }
      // CustomToasts.ErrorDialog("relogin".tr);
    }
    return handler.next(
      DioException(
        requestOptions: err.requestOptions,
        message: error!.tr,
      ),
    );
  }
}
