import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});
final String text; 
  @override
  Widget build(BuildContext context) {
    return AppBar( 
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600
      ),), 
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
      centerTitle: true, 
      actions: [
        Padding(
          padding:  EdgeInsets.all(Get.width*0.03),
          child: const Icon(Icons.home,color: Colors.black,),
        ) 
        
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height*0.07);
}