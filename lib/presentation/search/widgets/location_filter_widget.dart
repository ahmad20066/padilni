import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/search/controllers/search_controller.dart';

class LocationFilterWidget extends GetWidget<SearchScreenController> {
  const LocationFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Text(
                  "location".tr,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Obx(
                  () => SizedBox(
                    width: 80.w, // Set a larger width for the country dropdown
                    child: DropdownButton<int>(
                      isExpanded: true,
                      elevation: 2,
                      value: controller.selectedCountry.value?.id,
                      hint: Text(
                        'country'.tr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.sp),
                      ),
                      items: controller.countries.map((country) {
                        return DropdownMenuItem<int>(
                          value: country.id,
                          child: Text(
                            country.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        controller.selectCountry(newValue!);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Flexible(
                  child: Obx(() => DropdownButton<int>(
                        isExpanded: true,
                        value: controller.selectedCity.value?.id,
                        hint: Text(
                          'city'.tr,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12.sp),
                        ),
                        items: controller.cities.map((city) {
                          return DropdownMenuItem<int>(
                            value: city.id,
                            child: Text(
                              city.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12.sp),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.selectCity(newValue!);
                        },
                      )),
                ),
                SizedBox(width: 20.w),
                Flexible(
                  child: Obx(() => DropdownButton<int>(
                        isExpanded: true,
                        value: controller.selectedArea.value?.id,
                        hint: Text(
                          'area'.tr,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12.sp),
                        ),
                        items: controller.areas.map((area) {
                          return DropdownMenuItem<int>(
                            value: area.id,
                            child: Text(
                              area.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12.sp),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.selecArea(newValue!);
                        },
                      )),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              SizedBox(width: 30.w),
            ],
          ),
        ],
      );
    });
  }
}
