import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';
import 'package:padilni/presentation/add_item/widgets/add_textfield.dart';
import 'package:padilni/presentation/add_item/widgets/categories_dropdown.dart';
import 'package:padilni/presentation/add_item/widgets/images_container.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({super.key});
  final AddItemController controller = Get.put(AddItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        text: controller.color == null ? "Add Item" : "Edit Item",
        height: 0.08,
        hasLeading: true,
        color: controller.color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: Text(
                  "Please add details to the blanks with the required information"),
            ),
            Divider(
              thickness: 2,
              indent: Get.width * 0.07,
              endIndent: Get.width * 0.07,
            ),
            AddTextField(
              controller: controller.nameController,
              hint: "Item name",
              height: Get.height * 0.07,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            AddTextField(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              hint: "Item price",
              height: Get.height * 0.07,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CategoriesDropDown(categories: [
              CategoriesModel(
                  id: 1,
                  image:
                      "https://www.clipartmax.com/png/middle/197-1972391_take-away-drink-vector-soft-drink-silhouette.png",
                  name: "Drinks")
            ]),
            SizedBox(
              height: Get.height * 0.02,
            ),
            AddTextField(
              controller: controller.descriptionController,
              hint: "Description",
              height: Get.height * 0.25,
              // maxLines: 7,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Align(
                alignment: AlignmentDirectional(-0.6, 1), child: Text("Image")),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ImagesContainer()
          ],
        ),
      ),
    );
  }
}
