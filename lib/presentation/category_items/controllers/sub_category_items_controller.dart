import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class CategoryItemsController extends GetxController {
  List<ItemModel> items = [];
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final ItemsRepository _repo = ItemsRepository();
  int? id;
  getItems() async {
    status(RequestStatus.loading);

    final appResponse = await _repo.searchItems(category_id: id!);
    if (appResponse.success!) {
      items =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (items.isNotEmpty) {
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
    id = Get.arguments;
    getItems();
    super.onInit();
  }
}
