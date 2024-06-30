import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class ExchangeType extends StatelessWidget {
  const ExchangeType({super.key, this.icon, this.text});
  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      width: 351.w,
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              left: 5.w,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.exchangeColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 27,
                      offset: const Offset(0, 26),
                    )
                  ],
                ),
                height: 156.h,
                width: 351.w,
                child: Padding(
                  padding: REdgeInsets.all(25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.settingItemColor,
                          child: Icon(
                            icon,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          text!,
                          style: TextStyle(fontSize: 15.sp),
                        )
                      ]),
                ),
              ),
            ),
            Container(
                height: Get.height * 0.07,
                width: Get.width * 0.1,
                decoration: const BoxDecoration(
                    color: AppColors.exchangeColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward)),
          ]),
    );
  }
}
