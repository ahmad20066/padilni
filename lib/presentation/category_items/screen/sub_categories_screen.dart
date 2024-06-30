import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/category_items/controllers/sub_categories_controller.dart';
import 'package:padilni/presentation/category_items/widgets/sub_cat_widget.dart';
import 'package:padilni/presentation/home/widgets/categories/category_widget.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubCategoriesController());
    return Scaffold(
      appBar: CustomAppBar(text: "sub_categories".tr),
      body: Obx(() {
        switch (controller.status.value) {
          case RequestStatus.loading:
            return Loader();
          case RequestStatus.nodata:
            return NoData();
          case RequestStatus.success:
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: controller.subCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return SubCategoryWidget(
                    subCategory: controller.subCategories[index]);
              },
            );
          default:
            return SizedBox.shrink();
        }
      }),
    );
  }
}
