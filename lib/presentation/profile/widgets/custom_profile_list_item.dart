import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key});

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