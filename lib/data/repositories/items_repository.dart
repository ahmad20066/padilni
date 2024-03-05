import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item/item_model.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/utils/local/shared.dart';

class ItemsRepository {
  Future<AppResponse> addItem(ItemModel item) async {
    try {
      final response = await DioHelper.post(
          url: addItemUrl,
          token: Shared.getstring("token"),
          body: FormData.fromMap(await item.toMap()));
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> editItem(ItemModel item) async {
    try {
      final response = await DioHelper.post(
          url: editItemUrl,
          token: Shared.getstring("token"),
          body: FormData.fromMap(await item.toMap()));
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> deleteItem(int itemId) async {
    try {
      final response = await DioHelper.post(
          url: deleteItemUrl,
          token: Shared.getstring("token"),
          body: {"item_id": itemId});
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getMyItems() async {
    try {
      final response = await DioHelper.get(
          url: myItemsUrl, token: Shared.getstring("token")!);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
