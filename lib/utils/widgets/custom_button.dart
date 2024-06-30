import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onpressed,
      required this.child,
      required this.buttomColor,
      this.width = 352,
      this.heigth = 64});
  final Function()? onpressed;
  final Color buttomColor;
  final double width;
  final double heigth;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        height: heigth.h,
        width: width.h,
        margin: REdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: buttomColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: child,
      ),
    );
  }
}
