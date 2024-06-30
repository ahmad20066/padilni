import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:padilni/data/repositories/home_repository.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/banner/banner_model.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/models/section/section_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';

class HomeController extends GetxController {
  Rx<RequestStatus> homeStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> bannerStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> categoriesStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> sectionsStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> itemsStatus = RequestStatus.begin.obs;
  final HomeRepository _repo = HomeRepository();
  Map<String, dynamic>? homeResponseData;
  List<BannerModel> bannerItems = [];
  List<CategoriesModel> categories = [];
  RxList<SectionModel> sectionss = <SectionModel>[].obs;
  List<ItemModel> items = [];
  Rx<SectionModel?> selectedSection = Rx(null);
  getHomeInfo() async {
    homeStatus(RequestStatus.loading);
    final appResponse = await _repo.getHomeInfo();
    if (appResponse.success!) {
      homeResponseData = appResponse.data;
      getCategories();
      getBanner();
      getSections();
      homeStatus(RequestStatus.success);
    } else {
      homeStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  getHomeItems() async {
    itemsStatus(RequestStatus.loading);
    final appResponse = await _repo.getHomeItems(selectedSection.value!.id);
    if (appResponse.success!) {
      items =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (items.isEmpty) {
        itemsStatus(RequestStatus.nodata);
      } else {
        itemsStatus(RequestStatus.success);
      }
    } else {
      itemsStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  getCategories() async {
    categories = (homeResponseData!['categories'] as List)
        .map((e) => CategoriesModel.fromMap(e))
        .toList();
    if (categories.isEmpty) {
      categoriesStatus(RequestStatus.nodata);
    } else {
      categoriesStatus(RequestStatus.success);
    }
  }

  getBanner() async {
    bannerItems = (homeResponseData!['sliders'] as List)
        .map((e) => BannerModel.fromMap(e))
        .toList();
    if (bannerItems.isEmpty) {
      bannerStatus(RequestStatus.nodata);
    } else {
      bannerStatus(RequestStatus.success);
    }
  }

  getSections() {
    sectionss.value = (homeResponseData!['sections'] as List)
        .map((e) => SectionModel.fromMap(e))
        .toList();
    print(sectionss);
    if (sectionss.isEmpty) {
      sectionsStatus(RequestStatus.nodata);
    } else {
      selectedSection.value = sectionss[0];
      getHomeItems();
      sectionsStatus(RequestStatus.success);
    }
    print(sectionsStatus);
  }

  @override
  void onInit() {
    getHomeInfo();
    super.onInit();
  }
}
