import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final onChanged;
  final TextEditingController controller;
  const CustomSearchBar(
      {super.key, required this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.fifthcolor),
          borderRadius: BorderRadius.circular(28)),
      child: TextField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: const ImageIcon(
              AssetImage("assets/icons/search.png"),
            ),
            hintText: "search".tr,
            contentPadding: EdgeInsets.only(left: 20.w, bottom: 20.h),
            border: InputBorder.none),
      ),
    );
  }
}
