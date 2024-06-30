import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/models/country/country_model.dart';

import '../controllers/add_item_controller.dart';

class CountryDropDown extends StatelessWidget {
  final List<CountryModel> countries;
  const CountryDropDown({
    Key? key,
    required this.countries,
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
          value: controller.selectedCountry.value?.id,
          hint: Text(
            "country".tr,
            style: TextStyle(fontSize: 14.sp),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          ),
          items: countries
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.title)))
              .toList(),
          onChanged: (v) {
            controller.selectCountry(v!);
          }),
    );
    ;
  }
}
