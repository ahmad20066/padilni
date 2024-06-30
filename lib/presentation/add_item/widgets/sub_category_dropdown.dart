import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';

import '../../../models/categories/sub_category_model.dart';

class SubCategoryDropDown extends GetWidget<AddItemController> {
  const SubCategoryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemController>(builder: (_) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
        height: Get.height * 0.07,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(28)),
        child: DropdownButtonFormField(
            value: controller.selectedsubCategoryId.value,
            hint: Text(
              "sub_category".tr,
              style: TextStyle(fontSize: 14.sp),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
            ),
            items: controller.subCategories
                .map((e) => DropdownMenuItem(value: e.id, child: Text(e.title)))
                .toList(),
            onChanged: (v) {
              Get.find<AddItemController>().selectedsubCategoryId.value = v!;
            }),
      );
    });
  }
}
