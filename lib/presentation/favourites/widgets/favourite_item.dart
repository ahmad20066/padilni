import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.symmetric(
        vertical: Get.width*0.02, 
        horizontal: Get.width*0.08),
      child: Container(    
        width: Get.width*0.8,
        height: Get.height*0.29 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width*0.1),
            color:const Color(0xffFFFFFF), 
            boxShadow:  <BoxShadow>[  
               BoxShadow( 
                offset:  Offset(1, 3),
                spreadRadius: 0 ,
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5, 
               ) 
            ]
        ), 
          child: Column(
            children: [   
             SizedBox(height: Get.height*0.01,),

             ClipRRect(
               borderRadius: BorderRadius.circular(Get.width*0.1),
              child: Image.network("https://images.pexels.com/photos/4393021/pexels-photo-4393021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.fill,width: Get.width*0.77,height: Get.height*0.19,)
              ,) ,  
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.06),
                child: Row( 
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Market",style: Theme.of(context).textTheme.bodyMedium,) , 
                    SizedBox(width: Get.width*0.04,), 
                    Text("Food", style: Theme.of(context).textTheme.bodySmall!) ,
                  ],
                ), 
              ) , 
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.06),
                child: Row(children: [ 
                      Text("36\$" , 
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue
                ),) , 
                    const Spacer() , 
                    SvgPicture.asset("assets/images/garbage.svg" , 
                    width: Get.width*0.05,
                    height: Get.width*0.05,)

                     ],))
            ],
          ),
      ),
    );
  }
}