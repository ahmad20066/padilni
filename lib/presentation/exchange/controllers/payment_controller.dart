import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/enums/exchange_type.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/exchange/exchange_request_model.dart';
import 'package:padilni/presentation/details_screen/logic/details_controller.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class PaymentController extends GetxController {
  TextEditingController priceController = TextEditingController();
  final ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  exchangeWithCash() async {
    status(RequestStatus.loading);
    final request = ExchangeRequestModel(
        exchanged_item: Get.find<DetailsController>().item!.id,
        exchange_type: ExchangeTypeEnum.cash,
        price: double.parse(priceController.text));
    print(request.toMap());
    final appResponse = await _repo.exchangeItem(request);
    if (appResponse.success!) {
      if (Get.isRegistered<MyOrdersController>()) {
        Get.find<MyOrdersController>().getSentOrders();
      }
      status(RequestStatus.success);
      Get.until((route) => route.settings.name == AppRoutes.main);
      CustomToasts.SuccessDialog("Request Sent Successfully");
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
