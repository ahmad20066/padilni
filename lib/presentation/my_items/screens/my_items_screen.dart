import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/my_items/controllers/my_items_controller.dart';
import 'package:padilni/presentation/my_items/widgets/items_list.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/add_floating_button.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_search_bar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class MyItemsScreen extends StatelessWidget {
  const MyItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyItemsController controller = Get.put(MyItemsController());
    return Scaffold(
      // floatingActionButton: AddFloatingButton(onTap: () {
      //   Get.toNamed(AppRoutes.addItem);
      // }),
      appBar: CustomAppBar(
        text: "My Items",
        hasHomeIcon: false,
      ),
      body: Stack(
        children: [
          Obx(() {
            switch (controller.status.value) {
              case RequestStatus.loading:
                return Loader();
              case RequestStatus.success:
                return GetBuilder<MyItemsController>(builder: (context) {
                  return ItemsList(products: controller.myItems);
                });
              case RequestStatus.nodata:
                return NoData();
              default:
                return Container();
            }
          }),
          Container(
            height: 80.h,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      spreadRadius: 10,
                      blurRadius: 10)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42))),
          )
        ],
      ),
    );
  }
}
