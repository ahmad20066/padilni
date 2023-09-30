import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/profile/widgets/custom_profile_list_item.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Profile".tr,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600), 
      ), 
      centerTitle: true,  
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      elevation: 0.0, 
      ), 
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          GetHeight(height: Get.height*0.02), 

          Center(
            child: CircleAvatar(radius: Get.width*0.17
            ,backgroundColor: Colors.black,),
          ) , 

          GetHeight(height: Get.height*0.01),

            Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [  
            Icon(Icons.edit , size: Get.width*0.045,color: AppColors.secondaryColor,) ,
            Text("edit profile".tr , style: Theme.of(context).
            textTheme.bodySmall!.copyWith(color: AppColors.secondaryColor,
             fontSize: Get.width*0.035),) 
          ],) , 

             Text("Hi Ahmad !", style: Theme.of(context).textTheme.bodyLarge,) , 

             InkWell(
              onTap: (){},
              child: Text("Sign out", style: Theme.of(context).textTheme.bodySmall,)) , 

              GetHeight(height: Get.height*0.03),

              CustomProfileItem()





        ],
      ),
    );
  }
}