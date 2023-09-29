import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/colors.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({super.key,
  this.validator,
  this.controller});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  Pinput(
              validator: validator,
              controller: controller,
              defaultPinTheme: PinTheme(
                height: Get.height*0.054,
                width: Get.width*0.12,
                decoration:
                 BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
                 border: Border.all(color: AppColors.thirdColor) ,
                 borderRadius: BorderRadius.circular(Get.width*0.04)
                )
              ),
            );
  }
}