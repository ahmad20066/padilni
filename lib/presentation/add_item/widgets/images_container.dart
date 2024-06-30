import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';
import 'package:padilni/presentation/add_item/widgets/image_circle.dart';
import 'package:padilni/utils/colors.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddItemController());

    return Container(
      height: 530.h,
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
            height: Get.height * 0.2,
            width: Get.width,
            child: Stack(
              children: [
                Positioned(
                  left: Get.width * 0.15,
                  child: Container(
                    height: Get.height * 0.2,
                    width: Get.width * 0.7,
                    decoration: BoxDecoration(
                        color: AppColors.fifthcolor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Obx(() => controller.images.isNotEmpty
                    ? Positioned.fill(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                          child: Image.file(
                            controller.images.first.imageFile!,
                            fit: BoxFit.cover,
                            width: Get.width * 0.8,
                            height: Get.height * 0.15,
                          ),
                        ),
                      )
                    : SizedBox.shrink()),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(() => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                itemCount: controller.images.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: Get.width * 0.05,
                    mainAxisSpacing: Get.height * 0.03),
                itemBuilder: (context, index) {
                  if (index == controller.images.length) {
                    return GestureDetector(
                      onTap: () async {
                        await controller.pickImage(false);
                      },
                      child: Container(
                        height: 100.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: Offset(0, 3),
                                  spreadRadius: 3,
                                  blurRadius: 3)
                            ]),
                        child: Text(
                          "Add Image",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    return ImageCircle(image: controller.images[index]);
                  }
                },
              )),
        ],
      ),
    );
  }
}
