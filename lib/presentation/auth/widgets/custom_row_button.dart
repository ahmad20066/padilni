import 'package:flutter/material.dart';
import 'package:padilni/utils/colors.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({super.key, 
  required this.text1 ,
  required this.text2});
  final String text1; 
  final Widget text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        Text(text1,style: Theme.of(context).textTheme.
        bodySmall!.copyWith(color: AppColors.fourthColor),) ,
        text2 
      ],
    ) ;
  }
}