import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final onChanged;
  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      height: Get.height * 0.06,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.fifthcolor),
          borderRadius: BorderRadius.circular(28)),
      child: TextField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            suffixIcon: ImageIcon(
              AssetImage("assets/icons/search.png"),
              // color: Colors.black,
            ),
            hintText: "Search",
            contentPadding:
                EdgeInsets.only(left: Get.width * 0.1, top: Get.height * 0.015),
            border: InputBorder.none),
      ),
    );
  }
}
