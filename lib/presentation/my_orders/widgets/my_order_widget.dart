import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class MyOrderWidget extends StatelessWidget {
  final OrderModel order;
  final bool isSend;
  const MyOrderWidget({super.key, required this.order, required this.isSend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.myOrderDetailsRoute,
            arguments: {"order": order, "isSend": isSend});
      },
      child: Container(
        height: 195.h,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: Offset(3, 3),
                  blurRadius: 3)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // padding: REdgeInsets.symmetric(vertical: 20.h),
              height: 190.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: order.exchange_user.image != null
                        ? NetworkImage(
                            imagesBaseUrl + order.exchange_user.image!)
                        : AssetImage("assets/images/person.png")
                            as ImageProvider,
                  ),
                  Text(
                    order.exchange_user.name!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            // Spacer(),
            Container(
              width: 280.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Text(
                      "an_exchange_offer".tr,
                      style: TextStyle(
                          color: AppColors.fifthcolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    width: 220.w,
                    child: Stack(
                      children: [
                        Align(
                          // alignment: Alignment.centerRight,
                          child: Container(
                            // padding: EdgeInsets.all(10.sp),
                            width: 180.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                            ),
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 4,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Icon(
                                      Icons.swap_horiz,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        "exchange_with".tr,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 10.sp,
                                                color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                if (order.exchange_type == "cash")
                                  Text(
                                    order.price.toString() + "\$",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                SizedBox(
                                  width: 20.w,
                                )
                              ],
                            ),
                          ),
                        ),
                        if (order.exchanged_item != null &&
                            order.exchanged_item!.images.isNotEmpty)
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            start: 0,
                            child: CircleAvatar(
                              radius: 36.r,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(imagesBaseUrl +
                                  order.exchanged_item!.images.first.image!),
                            ),
                          ),
                        if (order.my_item != null &&
                            order.my_item!.images.isNotEmpty &&
                            order.exchange_type != "cash")
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 36.r,
                              backgroundImage: NetworkImage(imagesBaseUrl +
                                  order.my_item!.images.first.image!),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.5, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (order.extra_money != null)
                          SizedBox(
                            width: 200.w,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      "${order.exchange_user.name} ${"is_asking".tr}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 12.sp),
                                  children: [
                                    TextSpan(
                                        text: " ${order.extra_money}\$\n",
                                        style: TextStyle(color: Colors.red)),
                                    // TextSpan(
                                    //     recognizer: TapGestureRecognizer()
                                    //       ..onTap = () {
                                    //         print("sss");
                                    //       },
                                    //     text: "Show More >",
                                    //     style: TextStyle(color: Colors.green))
                                  ]),
                            ),
                          ),
                        if (order.offer_money != null)
                          SizedBox(
                            width: 200.w,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      "${order.exchange_user.name} ${"is_asking".tr}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 12.sp),
                                  children: [
                                    TextSpan(
                                        text: " ${order.offer_money}\$\n",
                                        style: TextStyle(color: Colors.green)),
                                    // TextSpan(
                                    //     recognizer: TapGestureRecognizer()
                                    //       ..onTap = () {
                                    //         print("sss");
                                    //       },
                                    //     text: "Show More >",
                                    //     style: TextStyle(color: Colors.green))
                                  ]),
                            ),
                          ),
                        SizedBox(
                          width: 10.w,
                        ),
                        if (isSend)
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 130.w,
                                // height: 30.h,
                                padding: REdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: order.status == "pending"
                                        ? Colors.blue
                                        : order.status == "rejected"
                                            ? Colors.red
                                            : Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        order.status.capitalize!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Icon(
                                        order.status == "pending"
                                            ? Icons.timelapse
                                            : order.status == "rejected"
                                                ? Icons.cancel_rounded
                                                : Icons.check_circle_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Obx(() => Get.find<MyOrdersController>()
                                          .cancelStatus
                                          .value ==
                                      RequestStatus.loading
                                  ? CircularProgressIndicator()
                                  : GestureDetector(
                                      onTap: () {
                                        Get.find<MyOrdersController>()
                                            .cancelOrder(order.id);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 3),
                                                  blurRadius: 3,
                                                  color: AppColors.shadowColor)
                                            ]),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                              SizedBox(
                                width: 30.w,
                              ),
                            ],
                          ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Positioned(
//   top: 0,
//   child: Container(
//     width: 124.w,
//     height: 220.h,
//     decoration: BoxDecoration(
//       color: AppColors.fifthcolor,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     margin: EdgeInsets.symmetric(
//         vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
//     child: Column(
//       children: [
//         SizedBox(
//           height: 10.h,
//         ),
//         CircleAvatar(
//           radius: 60.r,
//           backgroundImage: NetworkImage(
//               "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg"),
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         Text(
//           "Rima Sy",
//           style: Theme.of(context)
//               .textTheme
//               .bodyLarge!
//               .copyWith(color: Colors.white),
//         )
//       ],
//     ),
//   ),
// )
