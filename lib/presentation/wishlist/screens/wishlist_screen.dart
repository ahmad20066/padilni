import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';
import 'package:padilni/presentation/wishlist/controllers/wishlist_controller.dart';
import 'package:padilni/presentation/wishlist/widgets/wishlist_widget.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishListController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "wishlist".tr,
        hasHomeIcon: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              switch (controller.status.value) {
                case RequestStatus.loading:
                  return SizedBox(
                    height: 700.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestStatus.success:
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return WishlistWidget(item: controller.items[index]);
                    },
                  );
                case RequestStatus.nodata:
                  return SizedBox(height: 700.h, child: const NoData());
                default:
                  return const SizedBox.shrink();
              }
            })
          ],
        ),
      ),
    );
  }
}
