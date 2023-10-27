import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';

class CategoriesDropDown extends StatelessWidget {
  final List<CategoriesModel> categories;

  const CategoriesDropDown({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
      height: Get.height * 0.07,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(28)),
      child: DropdownButtonFormField(
          value: Get.find<AddItemController>().selectedcategoryId.value,
          hint: Text("Category"),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          ),
          items: categories
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
              .toList(),
          onChanged: (v) {
            Get.find<AddItemController>().selectedcategoryId.value = v!;
          }),
    );
  }
}
