import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  double? height = Get.height * 0.05;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  int maxLines;

  AddTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.height,
    this.validator,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: TextFormField(
        validator: validator,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 14.sp),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
