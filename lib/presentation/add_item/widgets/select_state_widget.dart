import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';
import 'package:padilni/utils/colors.dart';

class SelectStateWidget extends GetWidget<AddItemController> {
  const SelectStateWidget({super.key});
  Color _getStateChipColor(String state) {
    return controller.selectedState.value == state ? Colors.blue : Colors.white;
  }

  TextStyle _getStateChipTextStyle(String state) {
    return TextStyle(
      color:
          controller.selectedState.value == state ? Colors.white : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
              backgroundColor: _getStateChipColor('new'),
              selectedColor: AppColors.secondaryColor),
        ),
        Obx(
          () => FilterChip(
              label: Text(
                'old'.tr,
                style: _getStateChipTextStyle('used'),
              ),
              selected: controller.selectedState.value == 'old',
              onSelected: (isSelected) => controller.selectState('old'),
              backgroundColor: _getStateChipColor('used'),
              selectedColor: AppColors.secondaryColor),
        )
      ],
    );
  }
}
