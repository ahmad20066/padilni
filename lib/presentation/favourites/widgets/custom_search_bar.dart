import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key}); 


  @override
  Widget build(BuildContext context) {
    return Container(  
      width: Get.width*0.8,
      height: Get.height*0.07,
      decoration: BoxDecoration( 
        border: Border.all(color: AppColors.secondaryColor) ,
        borderRadius: BorderRadius.circular(Get.width*0.07) ,    
      ), 
      child:  Padding(
        padding: EdgeInsets.all(Get.width*0.04),
        child: Row( 
          children: [
              SizedBox(width: Get.width/5,),  
              Text("Search for Item" ,style: Theme.of(context).textTheme.bodySmall, ) , 
              const Spacer(), 
              const Icon(Icons.search) 
      
          ],
        ),
      ),

    );
  }
}