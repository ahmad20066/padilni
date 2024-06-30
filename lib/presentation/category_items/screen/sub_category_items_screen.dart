import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/category_items/controllers/sub_category_items_controller.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryItemsController controller =
        Get.put(CategoryItemsController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "category_items".tr,
        hasHomeIcon: false,
      ),
      body: Obx(() {
        switch (controller.status.value) {
          case RequestStatus.loading:
            return Loader();
          case RequestStatus.nodata:
            return NoData();
          case RequestStatus.success:
            return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.items.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 20.h,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 5.w),
                itemBuilder: (context, index) {
                  return ListItem(item: controller.items[index]);
                });
          default:
            return SizedBox.shrink();
        }
      }),
    );
  }
}
