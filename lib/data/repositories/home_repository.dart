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
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getSubCategories(int categoryId) async {
    try {
      final response = await DioHelper.get(
          url: subCategoriesUrl,
          token: Shared.getstring("token")!,
          query: {"category_id": categoryId});
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
