import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_details_controller.dart';
import 'package:padilni/presentation/my_orders/widgets/details/info_container.dart';
import 'package:padilni/presentation/my_orders/widgets/details/item_info.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyOrdersDetailsController());
    return Scaffold(
      appBar: CustomAppBar(text: "details".tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
            CircleAvatar(
              radius: 60.r,
              backgroundImage: controller.order!.exchange_user.image == null
                  ? AssetImage("assets/images/person.png")
                  : NetworkImage(controller.order!.exchange_user.image!)
                      as ImageProvider,
            ),
            SizedBox(
              height: 20.h,
            ),
            InfoContainer(
                title: "name".tr, value: controller.order!.exchange_user.name!),
            if (controller.order!.exchange_user.location != null)
              InfoContainer(
                  title: "location".tr,
                  value: controller.order!.exchange_user.location!),
            if (controller.order!.exchange_user.gender != null)
              InfoContainer(
                  title: "gender".tr,
                  value: controller.order!.exchange_user.gender!),
            if (controller.order!.exchanged_item != null)
              ItemInfo(item: controller.order!.exchanged_item),
            SizedBox(
              height: 20.h,
            ),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: Text(
                  "exchange_with".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                  ),
                )),
            if (controller.order!.extra_money != null)
              RichText(
                text: TextSpan(
                    text: "the_offer_includes".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                    children: [
                      TextSpan(
                          text: controller.order!.extra_money.toString() + "\$",
                          style: TextStyle(color: Colors.red))
                    ]),
              ),
            SizedBox(
              height: 20.h,
            ),
            CircleAvatar(
              radius: 60.r,
              backgroundImage: controller.order!.owner_user.image == null
                  ? AssetImage("assets/images/person.png")
                  : NetworkImage(controller.order!.owner_user.image!)
                      as ImageProvider,
            ),
            SizedBox(
              height: 20.h,
            ),
            InfoContainer(
                title: "name".tr, value: controller.order!.owner_user.name!),
            if (controller.order!.owner_user.location != null)
              InfoContainer(
                  title: "location".tr,
                  value: controller.order!.owner_user.location!),
            if (controller.order!.owner_user.gender != null)
              InfoContainer(
                  title: "gender".tr,
                  value: controller.order!.owner_user.gender!),
            if (controller.order!.my_item != null)
              ItemInfo(item: controller.order!.my_item),
            if (controller.order!.price != null)
              RichText(
                text: TextSpan(
                    text: "cash".tr + "   ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                    children: [
                      TextSpan(
                          text: controller.order!.price.toString() + "\$",
                          style: TextStyle(color: Colors.green))
                    ]),
              ),
            SizedBox(
              height: 30.h,
            ),
            if (!controller.isSend)
              Obx(() => controller.acceptStatus.value == RequestStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      onpressed: () {
                        controller.acceptExchange();
                      },
                      child: Text(
                        "accept".tr,
                        style: TextStyle(color: Colors.white),
                      ),
                      buttomColor: AppColors.secondaryColor)),
            SizedBox(
              height: 20.h,
            ),
            // if (!controller.isSend)
            CustomButton(
                onpressed: () {
                  Get.toNamed(AppRoutes.chatRoute, arguments: {
                    'order': controller.order,
                    'isSend': controller.isSend
                  });
                },
                child: Text(
                  "chat".tr,
                  style: TextStyle(color: Colors.white),
                ),
                buttomColor: Colors.blue),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
