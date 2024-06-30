import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/utils/local/shared.dart';

class HomeRepository {
  Future<AppResponse> getCategories() async {
    try {
      final response = await DioHelper.get(
          url: categoriesUrl, token: Shared.getstring("token")!);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getHomeInfo() async {
    try {
      final response = await DioHelper.get(
          url: homeInfoUrl, token: Shared.getstring("token")!);
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getHomeItems(int sectionId) async {
    try {
      final response = await DioHelper.get(
          url: homeitemsUrl,
          token: Shared.getstring("token")!,
          query: {
            "section_id": sectionId,
            'page': "home",
          });
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getBanner() async {
    try {
      final response = await DioHelper.get(
          url: bannerUrl, token: Shared.getstring("token")!);
      print("***********");
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
