import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  double? height = Get.height * 0.07;
  TextInputType keyboardType;
  // int maxLines;
  AddTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.height,
      this.keyboardType = TextInputType.name
      // this.maxLines = 1,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
      height: height,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(28)),
      child: TextField(
        // maxLines: null,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          hintText: hint,
        ),
      ),
    );
  }
}
