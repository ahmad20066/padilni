import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class WishListController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[].obs;
  final ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  getFavroites() async {
    status(RequestStatus.loading);
    final AppResponse appResponse = await _repo.getWishlist();
    if (appResponse.success!) {
      items.value =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (items.isEmpty) {
        status(RequestStatus.nodata);
      } else {
        status(RequestStatus.success);
      }
    } else {
      status(RequestStatus.onerror);
    }
  }

  addToFavorites(ItemModel item) async {
    if (items.any((element) => element.id == item.id)) {
      items.remove(item);
      if (items.isEmpty) {
        status(RequestStatus.nodata);
      }
    } else {
      items.add(item);
    }
    update();
    final appResponse = await _repo.addToFavorite(item.id);
    if (appResponse.success!) {
    } else {
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  checkIfFavorite(int id) {
    return items.any((element) => element.id == id);
  }

  @override
  void onInit() {
    getFavroites();
    super.onInit();
  }
}
