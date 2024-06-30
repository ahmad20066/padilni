import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/presentation/my_orders/widgets/my_orders_list.dart';
import 'package:padilni/presentation/my_orders/widgets/my_orders_tabbar.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyOrdersController controller = Get.put(MyOrdersController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
                    text: "my_orders".tr,
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
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await controller.getMyOrders();
                      },
                      child: Obx(() {
                        switch (controller.offerStatus.value) {
                          case RequestStatus.loading:
                            return Loader();
                          case RequestStatus.nodata:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NoData(),
                                IconButton(
                                    onPressed: () {
                                      controller.getMyOrders();
                                    },
                                    icon: Icon(Icons.refresh))
                              ],
                            );
                          case RequestStatus.success:
                            return MyOrdersList(
                              orders: controller.orders,
                              isSend: false,
                            );
                          default:
                            return SizedBox.shrink();
                        }
                      }),
                    ),
                    RefreshIndicator(
                      onRefresh: () async {
                        await controller.getSentOrders();
                      },
                      child: Obx(() {
                        switch (controller.sentOfferStatus.value) {
                          case RequestStatus.loading:
                            return Loader();
                          case RequestStatus.nodata:
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NoData(),
                                IconButton(
                                    onPressed: () {
                                      controller.getSentOrders();
                                    },
                                    icon: Icon(Icons.refresh))
                              ],
                            );
                          case RequestStatus.success:
                            return MyOrdersList(
                              orders: controller.sentOrders,
                              isSend: true,
                            );
                          default:
                            return SizedBox.shrink();
                        }
                      }),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
