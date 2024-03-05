import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';
import 'package:padilni/presentation/add_item/widgets/image_circle.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/custom_button.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddItemController>();
    return Container(
      height: Get.height * 0.65,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                spreadRadius: 7,
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
            height: Get.height * 0.2, // Set the height explicitly
            width: Get.width, // Set the width explicitly
            child: Stack(
              children: [
                Positioned(
                  left: Get.width * 0.15,
                  child: Container(
                    height: Get.height * 0.2,
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                        color: Get.find<AddItemController>().color ??
                            AppColors.fifthcolor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Positioned.fill(
                    // bottom: Get.height * 0.02,
                    child: Container(
                  // height: Get.height * 0.15,
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  child: Image.asset(
                    "assets/images/test_laptop.png",
                    fit: BoxFit.cover,
                    width: Get.width * 0.8,
                    height: Get.height * 0.15,
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: Get.width * 0.05,
                  mainAxisSpacing: Get.height * 0.03),
              itemBuilder: (context, index) {
                return ImageCircle();
              }),
          SizedBox(
            height: Get.height * 0.05,
          ),
          CustomButton(
              onpressed: () {
                !controller.isEdit
                    ? controller.addItem()
                    : controller.editItem();
              },
              buttomColor: controller.color ?? AppColors.fifthcolor,
              child: Text(
                !controller.isEdit ? "Add Item" : "Edit Item",
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
