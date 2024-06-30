import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/categories/sub_category_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class SubCategoriesController extends GetxController {
  List<SubCategoryModel> subCategories = [];
  final ItemsRepository _repo = ItemsRepository();
  int? categoryId;
  Rx<RequestStatus> status = RequestStatus.begin.obs;

  getSubCategories() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.getSubCategories(categoryId!);
    if (appResponse.success!) {
      subCategories = (appResponse.data as List)
          .map((e) => SubCategoryModel.fromMap(e))
          .toList();
      if (subCategories.isNotEmpty) {
        status(RequestStatus.success);
      } else {
        status(RequestStatus.nodata);
      }
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    categoryId = Get.arguments;
    getSubCategories();
    super.onInit();
  }
}
