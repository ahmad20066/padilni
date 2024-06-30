import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/main_screen/controller/navbar_controller.dart';
import 'package:padilni/presentation/wishlist/controllers/wishlist_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/add_floating_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final NavbarController controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WishListController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: AddFloatingButton(onTap: () {
        Get.toNamed(AppRoutes.addItem, arguments: {"isEdit": false});
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: 90.h,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: Get.width * 0.05,
          child: Obx(
            () => Row(
              children: <Widget>[
                // SizedBox(
                //   width: 20.w,
                // ),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                  onTap: () {
                    controller.currentIndex.value = 0;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/icons/home.png"),
                        color: controller.currentIndex.value == 0
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: 20.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "home".tr,
                        style: TextStyle(
                            fontSize: Get.locale!.languageCode == "ar"
                                ? 13.sp
                                : 10.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                InkWell(
                  onTap: () {
                    controller.currentIndex.value = 1;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/icons/search.png"),
                        color: controller.currentIndex.value == 1
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: 20.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "search".tr,
                        style: TextStyle(
                            fontSize: Get.locale!.languageCode == "ar"
                                ? 13.sp
                                : 10.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 130.w,
                ),
                InkWell(
                  onTap: () {
                    controller.currentIndex.value = 2;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/icons/bag.png"),
                        color: controller.currentIndex.value == 2
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: 20.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "my_orders".tr,
                        style: TextStyle(
                            fontSize: Get.locale!.languageCode == "ar"
                                ? 13.sp
                                : 10.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                InkWell(
                  onTap: () {
                    controller.currentIndex.value = 3;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/icons/settings.png"),
                        color: controller.currentIndex.value == 3
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: 20.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "settings".tr,
                        style: TextStyle(
                            fontSize: Get.locale!.languageCode == "ar"
                                ? 13.sp
                                : 10.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: Obx(() => controller.pages[controller.currentIndex.value]),
    );
  }
}
