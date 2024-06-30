import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/presentation/profile/controllers/profile_controller.dart';
import 'package:padilni/presentation/profile/widgets/custom_profile_list_item.dart';
import 'package:padilni/presentation/profile/widgets/language_switch.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600, fontSize: Get.width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetHeight(height: Get.height * 0.005),
            Obx(() {
              switch (controller.profileStatus.value) {
                case RequestStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestStatus.success:
                  print(controller.user!.image);
                  return Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: Get.width * 0.17,
                          // backgroundColor: Colors.black,
                          backgroundImage: controller.user!.image == null
                              ? AssetImage("assets/images/person.png")
                              : NetworkImage(controller.user!.image!)
                                  as ImageProvider,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.editProfileRoute,
                              arguments: controller.user);
                        },
                        child: SizedBox(
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: Get.width * 0.045,
                                color: AppColors.secondaryColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "edit_profile".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.secondaryColor,
                                        fontSize: Get.width * 0.035),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        controller.user!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  );
                default:
                  return Container();
              }
            }),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {
                  print("aaaa");
                  controller.logout();
                },
                child: Text(
                  "logout".tr,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            GetHeight(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("languages".tr),
                LanguageSwitch(),
              ],
            ),
            GetHeight(height: Get.height * 0.02),
            CustomProfileItem(
              svgUrl: "assets/images/notification.svg",
              text: "notifications".tr,
              pageUrl: AppRoutes.notificationsRoute,
            ),
            GetHeight(height: Get.height * 0.02),
            CustomProfileItem(
              svgUrl: "assets/images/fav.svg",
              text: "wishlist".tr,
              pageUrl: AppRoutes.wishlistRoute,
            ),
            GetHeight(height: Get.height * 0.02),
            CustomProfileItem(
                svgUrl: "assets/images/unlock_password.svg",
                pageUrl: AppRoutes.changePasswordRoute,
                text: "change_password".tr),
            GetHeight(height: Get.height * 0.02),
            CustomProfileItem(
                svgUrl: "assets/images/exchange1.svg",
                pageUrl: AppRoutes.myItemsScreen,
                text: "my_items".tr),
            SizedBox(
              height: 170.h,
            )
          ],
        ),
      ),
    );
  }
}
