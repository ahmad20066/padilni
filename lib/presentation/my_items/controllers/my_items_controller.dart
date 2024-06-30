import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';

class MyItemsController extends GetxController {
  RxList<ItemModel> myItems = <ItemModel>[].obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  Rx<RequestStatus> deleteStatus = RequestStatus.begin.obs;
  final ItemsRepository _repo = ItemsRepository();
  getMyItems() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.getMyItems();
    if (appResponse.success!) {
      myItems.value =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (myItems.isEmpty) {
        status(RequestStatus.nodata);
      } else {
        status(RequestStatus.success);
      }
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  deleteItem(int itemId) async {
    deleteStatus(RequestStatus.loading);
    final appResponse = await _repo.deleteItem(itemId);
    if (appResponse.success!) {
      deleteStatus(RequestStatus.success);
      myItems.removeWhere((element) => element.id == itemId);
      update();
      CustomDialogs.successToast("Item Deleted Successfully");
    } else {
      deleteStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getMyItems();
    super.onInit();
  }
}
