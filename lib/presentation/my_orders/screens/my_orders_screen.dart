import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/presentation/my_orders/widgets/my_orders_list.dart';
import 'package:padilni/presentation/my_orders/widgets/my_orders_tabbar.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});
  final MyOrdersController controller = Get.put(MyOrdersController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.25,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                          height: Get.height * 0.25,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    HomeAppbar(
                      text: "My Orders",
                      hasLeading: false,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              MyOrdersTabbar(),
              // SizedBox(
              //   height: Get.height * 0.03,
              // ),
              MyOrdersList(orders: controller.orders)
            ],
          ),
        ),
      ),
    );
  }
}
