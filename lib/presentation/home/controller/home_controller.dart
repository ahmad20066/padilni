import 'package:get/get.dart';
import 'package:padilni/data/repositories/home_repository.dart';
import 'package:padilni/models/banner/banner_model.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';

class HomeController extends GetxController {
  Rx<RequestStatus> categoriesStatus = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  List<BannerModel> bannerItems = [
    BannerModel(
        id: 1,
        image:
            "https://images.unsplash.com/photo-1484517186945-df8151a1a871?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJsYWtjJTIwdHNoaXJ0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    BannerModel(
        id: 2,
        image:
            "https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJsYWtjJTIwdHNoaXJ0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
  ];
  List<CategoriesModel> categories = [
    CategoriesModel(
        id: 1,
        image:
            "https://www.clipartmax.com/png/middle/197-1972391_take-away-drink-vector-soft-drink-silhouette.png",
        name: "Drinks")
  ];
  getCategories() async {
    categoriesStatus(RequestStatus.loading);
    final appResponse = await _repo.getCategories();
    if (appResponse.success!) {
      categories = (appResponse.data as List)
          .map((e) => CategoriesModel.fromMap(e))
          .toList();
      if (categories.isEmpty) {
        categoriesStatus(RequestStatus.nodata);
      } else {
        categoriesStatus(RequestStatus.success);
      }
    } else {
      categoriesStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }
}
