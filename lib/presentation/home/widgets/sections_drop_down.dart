import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/controller/home_controller.dart';
import 'package:padilni/utils/request_status.dart';

import '../../../models/section/section_model.dart';

class SectionsDropDown extends GetWidget<HomeController> {
  const SectionsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 328.w,
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
          height: 58.h,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
          ),
          child: DropdownButtonFormField<SectionModel>(
              value: controller.selectedSection.value,
              hint: Text(
                "sections".tr,
                style: TextStyle(fontSize: 20.sp),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              ),
              items: controller.sectionss
                  .map((e) => DropdownMenuItem<SectionModel>(
                      value: e, child: Text(e.title)))
                  .toList(),
              onChanged: (v) {
                controller.selectedSection.value = v;
                controller.getHomeItems();
              }),
        ));
  }
}
