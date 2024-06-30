import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/details_screen/logic/details_controller.dart';
import 'package:padilni/presentation/details_screen/widgets/first_component.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailsController());
    return Scaffold(
        bottomNavigationBar: controller.fromWishlist
            ? null
            : BottomAppBar(
                child: CustomButton(
                  onpressed: () {
                    Get.toNamed(AppRoutes.exchangeScreenRoute);
                  },
                  buttomColor: AppColors.secondaryColor,
                  child: Text(
                    "exchange".tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor, fontSize: 17.sp),
                  ),
                ),
              ),
        body: Obx(() {
          switch (controller.status.value) {
            case RequestStatus.loading:
              return Loader();
            case RequestStatus.nodata:
              return NoData();
            case RequestStatus.success:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DetailsPageView(images: controller.item!.images),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: const Divider(
                        color: AppColors.fourthColor,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: Row(
                        children: [
                          Text(
                            controller.item!.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: Get.width * 0.1,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.fourthColor),
                          )
                        ],
                      ),
                    ),
                    GetHeight(height: Get.height * 0.04),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/description.svg"),
                              GetWidth(width: Get.width * 0.03),
                              Text(
                                "description".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: Get.width * 0.07,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.fourthColor),
                              ),
                            ],
                          ),
                          GetHeight(height: Get.height * 0.02),
                          if (controller.item!.description != null)
                            Text(
                              controller.item!.description!,
                            ),
                          // Spacer(),

                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            default:
              return SizedBox.shrink();
          }
        }));
  }
}
