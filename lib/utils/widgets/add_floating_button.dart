import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class AddFloatingButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddFloatingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.09,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: AppColors.fifthcolor,
          onPressed: onTap,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
