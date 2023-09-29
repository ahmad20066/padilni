import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key,
     required this.image , 
     required this.text , 
     required this.onTap, 
     required this.padding});
  final String text; 
  final String image;
  final  Function()? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: TextButton(
        onPressed: onTap,
        child: Row(  
          children: [  
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(text , style: Theme.of(context).textTheme.bodySmall,),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(decoration: const  BoxDecoration(
                shape: BoxShape.circle , 
                color: AppColors.secondaryColor
              ),
              height: Get.height*0.03,
              width: Get.width*0.06,
              child: Image.asset(image),
              ),
            )
          ],),
      ),
    );

  }
}