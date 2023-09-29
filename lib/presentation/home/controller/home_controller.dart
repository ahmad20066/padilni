import 'package:get/get.dart';
import 'package:padilni/models/banner/banner_model.dart';
import 'package:padilni/models/categories/categories_model.dart';

class HomeController extends GetxController {
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
}
