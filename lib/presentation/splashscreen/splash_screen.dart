import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/logic/controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  var controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body: Image.asset("assets/images/splash.png" ,
      height: Get.height, 
      width: Get.width,
      fit: BoxFit.fill,));
  }
}

