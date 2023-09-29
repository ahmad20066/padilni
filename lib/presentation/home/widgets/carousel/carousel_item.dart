import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  const CarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        height: Get.height * 0.3,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          boxShadow: const [
            BoxShadow(blurRadius: 3.0),
          ],
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(1.00),
            width: 1,
          ),
        ),
        child: Image.network(image, fit: BoxFit.fitWidth));
  }
}
