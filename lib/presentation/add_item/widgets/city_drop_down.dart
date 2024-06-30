import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/models/country/city_model.dart';
import 'package:padilni/models/country/country_model.dart';

import '../controllers/add_item_controller.dart';

class CityDropDown extends StatelessWidget {
  final List<CityModel> cities;
  const CityDropDown({
    Key? key,
    required this.cities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddItemController>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
      height: Get.height * 0.07,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(28)),
      child: DropdownButtonFormField(
          value: controller.selectedCity.value?.id,
          hint: Text(
            "city".tr,
            style: TextStyle(fontSize: 14.sp),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          ),
          items: cities
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.title)))
              .toList(),
          onChanged: (v) {
            controller.selectCity(v!);
          }),
    );
    ;
  }
}
