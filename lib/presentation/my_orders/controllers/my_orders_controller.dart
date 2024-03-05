import 'package:get/get.dart';
import 'package:padilni/models/order/order_model.dart';

class MyOrdersController extends GetxController {
  RxList<OrderModel> orders = <OrderModel>[
    OrderModel(),
    OrderModel(),
    OrderModel(),
  ].obs;
}
