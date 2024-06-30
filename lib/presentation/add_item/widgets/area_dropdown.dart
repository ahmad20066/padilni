import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:padilni/models/area/area_model.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';

class AreaDropDown extends StatelessWidget {
  final List<AreaModel> areas;
  const AreaDropDown({
    Key? key,
    required this.areas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
      height: Get.height * 0.07,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(28)),
      child: DropdownButtonFormField<int>(
          value: Get.find<AddItemController>().selectedArea.value?.id,
          hint: Text(
            "area".tr,
            style: TextStyle(fontSize: 14.sp),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          ),
          items: areas
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.title)))
              .toList(),
          onChanged: (v) {
            Get.find<AddItemController>().selecArea(v!);
          }),
    );
    ;
  }
}
