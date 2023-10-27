import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key,
   required this.text,this.showHomeIcon = true});
final String text;  
final bool showHomeIcon ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w500  , 
        fontSize: Get.width*0.05
      ),), 
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      centerTitle: true, 
      actions: showHomeIcon == true ? [ 

        Padding(
          padding:  EdgeInsets.all(Get.width*0.03),
          child: const Icon(Icons.home,color: Colors.black,),
        ) 
        
      ] : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height * 0.07);
}
