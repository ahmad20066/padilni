import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/exchange/widgets/exchange_type.dart';
import 'package:padilni/utils/colors.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(title: Text("Exchange".tr, style: Theme.of(context).textTheme.bodyMedium!
      ,) ,
       centerTitle: true,
       backgroundColor: AppColors.primaryColor,
       elevation: 0.0,) , 
       body: SizedBox(
        width: Get.width,
         child: Stack(
          children: [  
          Positioned(
            bottom: 0,
            right: -Get.width*0.35,
            left: 0,
            top: Get.height*0.01,
            child: Padding(
              padding:  EdgeInsets.all(Get.width*0.12),
              child: Image.asset("assets/images/Path 2.png" ),
            )) , 
            Positioned(
            bottom: Get.height*0.7,
            right: 20,
            left: 20,
            top: Get.height*0.02,
           child:InkWell(
            onTap: ()
            {
            },
             child: const ExchangeType(
              svgUrl: "assets/images/exchange1.svg",
                     text: "Exchange with item from my list",),
           )),
           Positioned(
            bottom: Get.height*0.48,
            right: Get.width*0.05,
            left: Get.width*0.05,
            top: Get.height*0.24,
           child:InkWell(
            onTap: ()
            {
              Get.toNamed('/cash');
            },
             child: const ExchangeType(
             svgUrl: "assets/images/exchange2.svg",
             text: "Exchange via cash",),
           ))        
       
         ]),
       ),
    );
  }
}