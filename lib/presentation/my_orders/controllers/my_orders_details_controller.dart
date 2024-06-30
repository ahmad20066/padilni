import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class MyOrdersDetailsController extends GetxController {
  OrderModel? order;
  bool isSend = false;
  final ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> acceptStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> rejectStatus = RequestStatus.begin.obs;
  acceptExchange() async {
    acceptStatus(RequestStatus.loading);
    final appResponse = await _repo.acceptExchange(order!.id);
    if (appResponse.success!) {
      acceptStatus(RequestStatus.success);
      await Get.dialog(
        Center(
          child: Dialog(
            child: Container(
              height: 216.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 3,
                      offset: Offset(0, 7)),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "exchange_success".tr,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("contact_number".tr),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone_outlined),
                      SizedBox(
                        width: 10.w,
                      ),
                      SelectableText(!isSend
                          ? order!.exchange_user.phone ?? " "
                          : order!.owner_user.phone ?? " "),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
      Get.find<MyOrdersController>().getMyOrders();
      Get.back();
    } else {
      Get.back();
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    order = Get.arguments['order'];
    isSend = Get.arguments['isSend'];
    if (Get.arguments['isChat'] == true) {
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoutes.chatRoute,
            arguments: {'order': order, 'isSend': isSend});
      });
    }
    super.onInit();
  }
}
