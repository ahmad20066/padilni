import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});
final String text; 
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600
      ),), 
      centerTitle: true,
      actions: [
        Padding(
          padding:  EdgeInsets.all(Get.width*0.03),
          child: const Icon(Icons.home),
        ) 
        
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height*0.07);
}