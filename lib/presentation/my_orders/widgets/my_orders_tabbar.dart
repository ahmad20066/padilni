import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class MyOrdersTabbar extends StatelessWidget {
  const MyOrdersTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.fifthcolor,
      labelColor: AppColors.fifthcolor, // Set the selected tab's text color
      unselectedLabelColor: Color.fromRGBO(
          74, 75, 77, 0.8), // Set the unselected tabs' text color
      tabs: [
        Tab(
          child: SizedBox(
            width: Get.width * 0.25,
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage("assets/icons/recieved.png"),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                const Text(
                  "Recieved",
                ),
              ],
            ),
          ),
        ),
        Tab(
          child: SizedBox(
            width: Get.width * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.send,
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                const Text(
                  "Sent",
                ),
              ],
            ),
          ),
        ),
      ],
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
