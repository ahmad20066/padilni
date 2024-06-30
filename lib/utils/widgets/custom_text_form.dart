import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_width.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.validator,
      this.onChanged,
      this.onTap,
      this.type,
      this.suffix,
      this.obscure = false,
      this.prefix});
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final onChanged;
  final onTap;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      // height: 74.h,
      width: 361.w,
      child: TextFormField(
          readOnly: onTap != null,
          keyboardType: type,
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          obscureText: obscure,
          validator: validator,
          style: TextStyle(fontSize: 15.sp),
          decoration: InputDecoration(
              isDense: true,
              prefixIcon: prefix,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              filled: true,
              fillColor: AppColors.sixthcolor,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(28)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(28)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(28)),
              hintText: hinttext,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.eighthColor, fontSize: 15.sp),
              border: InputBorder.none,
              suffixIcon: suffix)),
    );
  }
}
