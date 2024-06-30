import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/enums/exchange_type.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/exchange/exchange_request_model.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/details_screen/logic/details_controller.dart';
import 'package:padilni/presentation/exchange/controllers/exchange_controller.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class ExchangeViaItemController extends GetxController {
  TextEditingController extraMoneyController = TextEditingController();
  TextEditingController offerMoneyController = TextEditingController();
  List<ItemModel> myItems = [];
  ItemModel? selectedItem;
  ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> myItemsStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> exchangeStatus = RequestStatus.begin.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  getMyItems() async {
    myItemsStatus(RequestStatus.loading);
    final appResponse = await _repo.getMyItems();
    if (appResponse.success!) {
      myItems =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (myItems.isEmpty) {
        myItemsStatus(RequestStatus.nodata);
      } else {
        myItemsStatus(RequestStatus.success);
      }
    } else {
      myItemsStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  selectItem(int id) {
    selectedItem = myItems.firstWhere((element) => element.id == id);
    update();
  }

  unSelectItem() {
    selectedItem = null;
    update();
  }

  exchangeItem() async {
    exchangeStatus(RequestStatus.loading);
    final request = ExchangeRequestModel(
      exchanged_item: Get.find<DetailsController>().item!.id,
      exchange_type: ExchangeTypeEnum.change,
      my_item: selectedItem!.id,
      offer_money: offerMoneyController.text.isNotEmpty
          ? double.parse(offerMoneyController.text)
          : null,
      extra_money: extraMoneyController.text.isNotEmpty
          ? double.parse(extraMoneyController.text)
          : null,
    );
    final appResponse = await _repo.exchangeItem(request);
    if (appResponse.success!) {
      exchangeStatus(RequestStatus.success);
      if (Get.isRegistered<MyOrdersController>()) {
        Get.find<MyOrdersController>().getSentOrders();
      }
      Get.until((route) => route.settings.name == AppRoutes.main);
      CustomToasts.SuccessDialog("Request Sent Successfully");
    } else {
      exchangeStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getMyItems();
    super.onInit();
  }
}
