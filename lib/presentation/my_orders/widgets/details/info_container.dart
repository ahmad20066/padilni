import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padilni/utils/colors.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;
  const InfoContainer({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      height: 50.h,
      width: 400.w,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: AppColors.shadowColor, blurRadius: 6),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              title,
              style: const TextStyle(color: Color(0xffb6b7b7)),
            ),
          ),
          // SizedBox(),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 40.w,
          )
        ],
      ),
    );
  }
}
