import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';

import 'interceptor.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: 500000),
        receiveTimeout: Duration(milliseconds: 300000),
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    dio!.interceptors.add(
      AppInterceptors(
        dio: dio,
      ),
    );
  }

  static Future<Response> get(
      {required String url,
      Map<String, dynamic>? data,
      String token = "",
      Map<String, dynamic>? query,
      String? customApi}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    if (customApi != null) {
      print(customApi);
      dio!.options.baseUrl = customApi;
    }

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    Object? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.patch(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: body,
    );
  }
}

class ApiManager {
  Dio? dio;

  ApiManager(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Modify the request options to set the base URL
        options.baseUrl = baseUrl;
        return handler.next(options);
      },
    ));
  }
}
