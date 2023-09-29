import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
  required this.onpressed,
  required this.child, 
  required this.buttomColor});
final Function()? onpressed ;
final Color buttomColor;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Get.width*0.07),
      child: MaterialButton( 
        color:buttomColor,
        minWidth: Get.width*0.75,
        height: Get.height*0.07,
        onPressed:onpressed ,
      child: child,
    ));
  }
}