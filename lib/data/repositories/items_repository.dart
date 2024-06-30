import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/exchange/exchange_request_model.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/models/message/message_model.dart';
import 'package:padilni/utils/local/shared.dart';

class ItemsRepository {
  Future<AppResponse> addItem(ItemModel item) async {
    try {
      print(await item.toMap());
      final response = await DioHelper.post(
          url: addItemUrl,
          token: Shared.getstring("token"),
          body: FormData.fromMap(await item.toMap()));
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> exchangeItem(ExchangeRequestModel item) async {
    try {
      print(item.toMap());
      final response = await DioHelper.post(
          url: exchangeItemUrl,
          token: Shared.getstring("token"),
          body: item.toMap());
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> editItem(ItemModel item) async {
    try {
      final response = await DioHelper.post(
          url: editItemUrl + "/${item.id}",
          token: Shared.getstring("token"),
          body: FormData.fromMap(await item.toMap()));
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> addToFavorite(int id) async {
    try {
      final response = await DioHelper.post(
        url: "$addToFavUrl/$id",
        token: Shared.getstring("token"),
      );
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> deleteItem(int itemId) async {
    try {
      final response = await DioHelper.delete(
        url: "$deleteItemUrl/$itemId",
        token: Shared.getstring("token"),
      );
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getMyItems() async {
    try {
      final response = await DioHelper.get(
          url: myItemsUrl,
          query: {"page": "widthDetails"},
          token: Shared.getstring("token")!);
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getWishlist() async {
    try {
      final response = await DioHelper.get(
          url: myFavoritesUrl,
          // query: {"page": "widthDetails"},
          token: Shared.getstring("token")!);
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> searchItems(
      {int? country_id,
      int? city_id,
      int? area_id,
      String? search_text,
      int? category_id,
      String? status}) async {
    try {
      final response = await DioHelper.get(
          url: searchUrl,
          token: Shared.getstring("token")!,
          query: {
            'page': "search",
            if (category_id != null) "sub_category_id": category_id,
            if (country_id != null) "country_id": country_id,
            if (city_id != null) "city_id": city_id,
            if (area_id != null) "area_id": area_id,
            if (search_text != null) "search_text": search_text,
            if (status != null) "status": status,
          });
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> showItem(int id) async {
    try {
      final response = await DioHelper.get(
        url: "$showItemUrl$id?page=widthDetails",
        token: Shared.getstring("token")!,
      );
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getAreas() async {
    try {
      final response =
          await DioHelper.get(url: areasUrl, token: Shared.getstring("token")!);
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getCountries() async {
    try {
      final response = await DioHelper.get(
          url: countriesUrl, token: Shared.getstring("token")!);
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getExchangeOffers(String filter) async {
    try {
      final response = await DioHelper.get(
          url: exchangeOffersUrl,
          token: Shared.getstring("token")!,
          query: {"exchange_filter": filter});
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> acceptExchange(int id) async {
    try {
      final response = await DioHelper.patch(
        url: "$acceptItemUrl/$id",
        token: Shared.getstring("token"),
      );
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> rejectExchange(int id) async {
    try {
      final response = await DioHelper.patch(
        url: "$rejectItemUrl/$id",
        token: Shared.getstring("token"),
      );
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> cancelExchange(int id) async {
    try {
      final response = await DioHelper.patch(
        url: "$cancelItemUrl/$id",
        token: Shared.getstring("token"),
      );
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> sendMessage(MessageModel message) async {
    try {
      final response = await DioHelper.post(
          url: sendMessageUrl,
          token: Shared.getstring("token"),
          body: message.toMap());
      print("****");
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getConversation(int exchangeId) async {
    try {
      final response = await DioHelper.get(
        url: "$getConversationUrl/$exchangeId",
        token: Shared.getstring("token")!,
      );
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> getSubCategories(int categoryId) async {
    try {
      final response = await DioHelper.get(
        url: "$subCategoriesUrl/$categoryId",
        token: Shared.getstring("token")!,
      );
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
