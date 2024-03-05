import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/main_screen/controller/navbar_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/add_floating_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final NavbarController controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: AddFloatingButton(onTap: () {
        Get.toNamed(
          AppRoutes.addItem,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: Get.height * 0.1,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: Get.width * 0.05,
          child: Obx(
            () => Row(
              children: <Widget>[
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/home.png"),
                        color: controller.currentIndex.value == 0
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: Get.width * 0.075,
                      ),
                      onPressed: () {
                        controller.currentIndex.value = 0;
                      },
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/search.png"),
                        color: controller.currentIndex.value == 1
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: Get.width * 0.075,
                      ),
                      onPressed: () {
                        controller.currentIndex.value = 1;
                      },
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/bag.png"),
                        color: controller.currentIndex.value == 2
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: Get.width * 0.075,
                      ),
                      onPressed: () {
                        controller.currentIndex.value = 2;
                      },
                    ),
                    Text(
                      "My Orders",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/icons/settings.png"),
                        color: controller.currentIndex.value == 3
                            ? AppColors.fifthcolor
                            : Colors.grey,
                        size: Get.width * 0.075,
                      ),
                      onPressed: () {
                        controller.currentIndex.value = 3;
                      },
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          )),
      body: Obx(() => controller.pages[controller.currentIndex.value]),
    );
  }
}
