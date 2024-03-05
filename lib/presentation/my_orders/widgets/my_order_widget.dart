import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/utils/colors.dart';

class MyOrderWidget extends StatelessWidget {
  final OrderModel order;
  const MyOrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190.h,
          margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(3, 3),
                    blurRadius: 3)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Align(
                alignment: AlignmentDirectional(0.65, 1),
                child: Text(
                  "An exchangement offer",
                  style: TextStyle(
                      color: AppColors.fifthcolor, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: AlignmentDirectional(0.6, 1),
                child: SizedBox(
                  width: 200.w,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5.h,
                        left: 25.w,
                        child: Container(
                          width: 150.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                              color: AppColors.fifthcolor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              ImageIcon(
                                AssetImage("assets/icons/exchange.png"),
                                color: AppColors.seventhColor,
                              ),
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                  "Exchange With",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage: NetworkImage(
                                "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg"),
                          ),
                          SizedBox(
                            width: 65.w,
                          ),
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage: NetworkImage(
                                "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: AlignmentDirectional(0.5, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Rima is asking for Extra cash ",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12.sp),
                          children: [
                            TextSpan(
                                text: "50\$\n",
                                style: TextStyle(color: Colors.red)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("sss");
                                  },
                                text: "Show More >",
                                style: TextStyle(color: Colors.green))
                          ]),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
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
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: 124.w,
            height: 220.h,
            decoration: BoxDecoration(
              color: AppColors.fifthcolor,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(
                vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: NetworkImage(
                      "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Rima Sy",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
