import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(  
        horizontal: Get.width*0.06,
        vertical: Get.width*0.02
      ),
      child: Container( 
        // height: Get.height*0.08,
        width: Get.width*0.9,
      decoration:  BoxDecoration( 
        borderRadius: BorderRadius.circular(Get.width*0.04),
        color: const Color(0xffE6D6FC) ,  
      ),  
      child: Column(
        children: [  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [ 
                Container(  
                  height: Get.height*0.04,
                  width: Get.width*0.6,
             decoration: BoxDecoration( 
             borderRadius: BorderRadius.circular(Get.width*0.04),
             color: Colors.white , 
             
             ) ,
             child:  Center(child: Text("Item Saved by another user", 
             style: TextStyle(fontSize: Get.width*0.035 , color: AppColors.thirdColor),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,)),
                ) ,
                const Spacer() , 
                 Text("17/7/2023" , style: TextStyle(fontSize: Get.width*0.035 , color: AppColors.thirdColor))
              ],
            ),
          ) ,  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, Ut enim ad minim veniam" , 
            style: TextStyle(fontSize: Get.width*0.035),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,),
          )

        ],
      ),
    
      ),
    );
  }
}