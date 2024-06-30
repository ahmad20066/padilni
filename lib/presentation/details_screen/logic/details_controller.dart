import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';

class DetailsController extends GetxController {
  ItemModel? item;
  bool fromWishlist = false;
  ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  int? id;
  showItem() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.showItem(id!);
    if (appResponse.success!) {
      item = ItemModel.fromMap(appResponse.data);
      status(RequestStatus.success);
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    id = Get.arguments['id'];
    fromWishlist = Get.arguments['fromWishlist'];
    showItem();
    super.onInit();
  }
}
