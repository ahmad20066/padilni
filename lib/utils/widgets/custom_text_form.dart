import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.validator,
      this.suffix});
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.07, Get.height * 0.005,
          Get.width * 0.07, Get.width * 0.005),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.sixthcolor,
            borderRadius: BorderRadius.circular(Get.width * 0.07)),
        height: Get.height * 0.07,
        child: Padding(
          padding: EdgeInsets.only(
            left: Get.width * 0.06,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                    validator: validator,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                      hintText: hinttext,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.eighthColor),
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(
                width: Get.width * 0.2,
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.02),
                  child: Row(
                    children: [
                      SizedBox(
                          height: Get.height * 0.03,
                          child: const VerticalDivider(
                            color: AppColors.seventhColor,
                          )),
                      Icon(
                        suffix,
                        color: AppColors.seventhColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
