import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class ExchangeType extends StatelessWidget {
  const ExchangeType({super.key,
  this.svgUrl,
  this.text});
 final String? svgUrl ;
 final String? text; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(  
      height: Get.height/5.3,
     width: Get.width*0.83,
        child: Stack(    
        clipBehavior: Clip.none,
        alignment: Alignment.centerRight,
        children: [  
          SizedBox(
            width: Get.width*0.83,
            child: Stack( 
              alignment: Alignment.centerLeft,
              children: [
                Container(  
                  decoration: BoxDecoration( 
                    color:AppColors.exchangeColor,
                    borderRadius: BorderRadius.circular(5),
                     boxShadow: [
                         BoxShadow(
               color: Colors.grey.withOpacity(0.5),
               blurRadius: 27,
               offset: const Offset(0, 26),)], 
                  ),
                  height: Get.height/5.3, 
                  width: Get.width*0.78,
                  child: Padding(
                    padding:  EdgeInsets.all(Get.width*0.035),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       CircleAvatar(radius: Get.width*0.05,
                       backgroundColor: AppColors.settingItemColor,
                       child: SvgPicture.asset(svgUrl!),) ,
                       Text(text! , style: Theme.of(context).textTheme.bodyMedium,)
                        ]),
                  ) ,
                ),
              ],
            ),
          ), 

          Container(
            height: Get.height*0.07,
            width: Get.width*0.1, 
            decoration:const BoxDecoration(
            color:AppColors.exchangeColor ,
            shape: BoxShape.circle),
            child:const Icon(Icons.arrow_forward)
            ),
        ]
      ),
    );
  }
}