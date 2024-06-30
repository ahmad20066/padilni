import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:padilni/presentation/search/controllers/search_controller.dart';
import 'package:padilni/utils/colors.dart';

class StatusFilterWidget extends GetWidget<SearchScreenController> {
  const StatusFilterWidget({super.key});

  TextStyle _getStateChipTextStyle(String state) {
    return TextStyle(
        color: controller.selectedState.value == state
            ? Colors.white
            : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
        ),
        Text(
          "status".tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
        ),
        Spacer(),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            Obx(
              () => FilterChip(
                  label: Text(
                    'new'.tr,
                    style: _getStateChipTextStyle('new'),
                  ),
                  selected: controller.selectedState.value == 'new',
                  onSelected: (isSelected) => controller.selectState('new'),
                  backgroundColor: Colors.white,
                  checkmarkColor: Colors.white,
                  selectedColor: AppColors.secondaryColor),
            ),
            Obx(
              () => FilterChip(
                  label: Text(
                    'old'.tr,
                    style: _getStateChipTextStyle('old'),
                  ),
                  selected: controller.selectedState.value == 'old',
                  checkmarkColor: Colors.white,
                  onSelected: (isSelected) => controller.selectState('old'),
                  backgroundColor: Colors.white,
                  selectedColor: AppColors.secondaryColor),
            )
          ],
        ),
        SizedBox(
          width: 30.w,
        )
      ],
    );
  }
}
