import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            width: 150.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageIcon(
                  AssetImage("assets/icons/recieved.png"),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "received".tr,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Tab(
          child: Container(
            width: 150.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.send,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "sent".tr,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
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
