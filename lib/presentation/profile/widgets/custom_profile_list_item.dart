import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_width.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key,
  this.svgUrl,
  this.text});
 final String? svgUrl ;
 final String? text; 
  @override
  Widget build(BuildContext context) {
    return SizedBox( 
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  height: Get.height*0.1, 
                  width: Get.width*0.8,
                  child: Padding(
                    padding:  EdgeInsets.all(Get.width*0.025),
                    child: Row(children: [
                       CircleAvatar(radius: Get.width*0.06,
                       backgroundColor: AppColors.settingItemColor,
                       child: SvgPicture.asset(svgUrl!),) ,
                       GetWidth(width: Get.width*0.05), 
                       Text(text!)
                        ]),
                  ) ,
                ),
              ],
            ),
          ), 

          Container(
            height: Get.height*0.06,
            width: Get.width*0.08, 
            decoration: BoxDecoration(color:Colors.grey[200] ,
            shape: BoxShape.circle),
            child:Icon(Icons.arrow_forward)
            ),
        ]
      ),
    );
  }
}