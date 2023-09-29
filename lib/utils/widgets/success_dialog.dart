import 'package:flutter/material.dart';
import 'package:get/get.dart';

successDialog(String content) async {
  await showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text(content),
          icon: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 25,
          ),
        );
      });
}
