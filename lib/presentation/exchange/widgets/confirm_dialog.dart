import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_button.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: Get.width,
        height: 500.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.5,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 4,
                      spreadRadius: 0,
                    )
                  ],
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Get.width * 0.08),
                      bottomRight: Radius.circular(Get.width * 0.08))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SvgPicture.asset("assets/images/warning.svg"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      "you_are_exchanging".tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(Get.width * 0.04),
                  //   child: Text(
                  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna alix ea commodo consequat",
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .bodySmall!
                  //         .copyWith(fontSize: Get.width * 0.035),
                  //   ),
                  // ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                      child: CustomButton(
                          onpressed: () {
                            Get.back(result: true);
                          },
                          buttomColor: AppColors.secondaryColor,
                          child: Text(
                            "yes".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.primaryColor),
                          ))),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: CustomButton(
                          onpressed: () {
                            Get.back(result: false);
                          },
                          buttomColor: AppColors.declineColor,
                          child: Text(
                            "no".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.primaryColor),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
