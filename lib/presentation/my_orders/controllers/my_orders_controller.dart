import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class MyOrdersController extends GetxController {
  List<OrderModel> orders = [];
  List<OrderModel> sentOrders = [];
  final ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> offerStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> cancelStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> sentOfferStatus = RequestStatus.begin.obs;
  getMyOrders() async {
    offerStatus(RequestStatus.loading);
    final appResponse = await _repo.getExchangeOffers("received");
    if (appResponse.success!) {
      orders =
          (appResponse.data as List).map((e) => OrderModel.fromMap(e)).toList();
      int? id = Get.arguments?['id'];

      if (id != null) {
        if (orders.any((element) => element.id == id)) {
          Get.toNamed(AppRoutes.myOrderDetailsRoute, arguments: {
            "order": orders.firstWhere((element) => element.id == id),
            "isSend": false,
            "isChat": Get.arguments['isChat']
          });
        }
      }
      if (orders.isEmpty) {
        offerStatus(RequestStatus.nodata);
      } else {
        offerStatus(RequestStatus.success);
      }
    } else {
      offerStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  getSentOrders() async {
    sentOfferStatus(RequestStatus.loading);
    final appResponse = await _repo.getExchangeOffers("send");
    if (appResponse.success!) {
      sentOrders =
          (appResponse.data as List).map((e) => OrderModel.fromMap(e)).toList();
      int? id = Get.arguments?['id'];
      print("------------");
      print(id);

      if (id != null) {
        if (sentOrders.any((element) => element.id == id)) {
          Get.toNamed(AppRoutes.myOrderDetailsRoute, arguments: {
            "order": sentOrders.firstWhere((element) => element.id == id),
            "isSend": true,
            "isChat": Get.arguments['isChat']
          });
        }
      }
      if (sentOrders.isEmpty) {
        sentOfferStatus(RequestStatus.nodata);
      } else {
        sentOfferStatus(RequestStatus.success);
      }
    } else {
      sentOfferStatus(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  cancelOrder(int id) async {
    cancelStatus(RequestStatus.loading);
    final appResponse = await _repo.cancelExchange(id);
    if (appResponse.success!) {
      cancelStatus(RequestStatus.success);
      sentOrders.removeWhere((element) => element.id == id);
    } else {
      cancelStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    print(Get.arguments);
    getMyOrders();
    getSentOrders();

    super.onInit();
  }
}
