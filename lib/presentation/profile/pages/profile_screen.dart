import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/profile/controllers/profile_controller.dart';
import 'package:padilni/presentation/profile/widgets/custom_profile_list_item.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile".tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600, fontSize: Get.width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetHeight(height: Get.height * 0.005),
          Center(
            child: CircleAvatar(
              radius: Get.width * 0.17,
              backgroundColor: Colors.black,
            ),
          ),
          GetHeight(height: Get.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size: Get.width * 0.045,
                color: AppColors.secondaryColor,
              ),
              Text(
                "editProfile".tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: Get.width * 0.035),
              )
            ],
          ),
          Text(
            "Hi Ahmad !",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          InkWell(
              onTap: () {
                print("aaaa");
                controller.logout();
              },
              child: Text(
                "Sign out",
                style: Theme.of(context).textTheme.bodySmall,
              )),
          GetHeight(height: Get.height * 0.03),
          CustomProfileItem(
            svgUrl: "assets/images/heart.svg",
            text: "favourites",
          ),
          GetHeight(height: Get.height * 0.02),
          CustomProfileItem(
            svgUrl: "assets/images/text.svg",
            text: "Languages",
          ),
          GetHeight(height: Get.height * 0.02),
          CustomProfileItem(
            svgUrl: "assets/images/notification.svg",
            text: "Notifications",
          ),
          GetHeight(height: Get.height * 0.02),
          CustomProfileItem(
              svgUrl: "assets/images/unlock_password.svg",
              text: "change password"),
        ],
      ),
    );
  }
}
