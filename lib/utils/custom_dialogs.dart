import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  static errorToast(String message, {Icon? icon}) {
    Get.snackbar("Error", message,
        icon: icon,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.red);
  }

  static successToast(String message, {Icon? icon}) {
    Get.snackbar("Success", message.tr,
        icon: icon,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.green);
  }
}
