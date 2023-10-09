import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/details_screen/widgets/first_component.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DetailsPageView(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: const Divider(
              color: AppColors.fourthColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Row(
              children: [
                Text(
                  "Market",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: Get.width * 0.1,
                      fontWeight: FontWeight.w300,
                      color: AppColors.fourthColor),
                )
              ],
            ),
          ),
          GetHeight(height: Get.height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/description.svg"),
                    GetWidth(width: Get.width * 0.03),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: Get.width * 0.07,
                          fontWeight: FontWeight.w300,
                          color: AppColors.fourthColor),
                    ),
                  ],
                ),
                GetHeight(height: Get.height * 0.02),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint"),
                GetHeight(height: Get.height * 0.009),
                CustomButton(
                  onpressed: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  buttomColor: AppColors.secondaryColor,
                  child: Text(
                    "Exchange",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: Get.width * 0.045),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
