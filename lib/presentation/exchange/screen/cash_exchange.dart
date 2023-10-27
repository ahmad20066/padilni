import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class CashExchangeScreen extends StatelessWidget {
  const CashExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold( 
        backgroundColor:  AppColors.primaryColor,
        body: SizedBox(
          width: Get.width,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: Get.height*0.5,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius:4,
                      spreadRadius: 0,
                    )],
                border: Border.all(color: Colors.grey[200]!) ,
                borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Get.width*0.08 ),
                bottomRight: Radius.circular(Get.width*0.08 ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding:  EdgeInsets.all(Get.width*0.04),
                    child: SvgPicture.asset("assets/images/back_icon.svg",), 
                  ) , 
                  Center(child: SvgPicture.asset("assets/images/warning.svg"),) , 
                  GetHeight(height: Get.height*0.007),
                  Center(child: Text("You are exchanging item via cash",
                  style: Theme.of(context).textTheme.bodySmall,),) ,
                  GetHeight(height: Get.height*0.03), 
                  Padding(
                    padding:  EdgeInsets.all(Get.width*0.04),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna alix ea commodo consequat",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: Get.width*0.035),),
                  ) ,  

                  Center(child: CustomButton(onpressed: (){},
                     buttomColor: AppColors.secondaryColor,
                   child: Text("YES , Confirm",
                    style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: AppColors.primaryColor),))) ,

                     GetHeight(height: Get.height*0.008),

                  Center(child: CustomButton(onpressed: (){},
                     buttomColor: AppColors.declineColor,
                     child:  Text("No , Decline",
                    style: Theme.of(context).textTheme.bodySmall!.
                    copyWith(color: AppColors.primaryColor),)))            
                ],),
                )
            ],
          ),
        ),),
    );
  }
}