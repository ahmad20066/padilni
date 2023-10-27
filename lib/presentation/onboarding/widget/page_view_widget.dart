import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class CustomPageWidget extends StatelessWidget {
  const CustomPageWidget({
    super.key,
    required this.imagePath,
    required this.height});
final String imagePath;
final double height ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: Get.width*0.01 ,right: Get.width*0.01 ),
      child: Column(
        children: [
          
            Container( 
              height: height,
              width: Get.width,
             decoration: BoxDecoration(
              color:AppColors.primaryColor,
              boxShadow:const [
               BoxShadow(
               blurRadius: 3.0 ),],
               border: 
               Border.all(color: AppColors.secondaryColor.withOpacity(1.00) ,
               width: 1 ,) ,
                borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(Get.height*0.1),
               bottomRight:Radius.circular(Get.height*0.1))
              ),
               child: ClipRRect(
                borderRadius: BorderRadius.only(
              bottomLeft:Radius.circular(Get.height*0.1),
               bottomRight:Radius.circular(Get.height*0.1),),
               child:  Image.asset(imagePath , fit: BoxFit.cover))),
                  SizedBox(height: Get.height*0.001,)
          
        ],
      ),
    );
  }
}