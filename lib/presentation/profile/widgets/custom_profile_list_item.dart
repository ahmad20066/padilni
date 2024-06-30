import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_width.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem(
      {super.key, this.svgUrl, this.text, required this.pageUrl});
  final String? svgUrl;
  final String? text;
  final String pageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(pageUrl);
      },
      child: Container(
        width: 335.w,
        height: 79.h,
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            CircleAvatar(
              radius: 28.r,
              backgroundColor: AppColors.settingItemColor,
              child: SvgPicture.asset(
                svgUrl!,
                height: 20.h,
                width: 23.w,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              text!,
              style: TextStyle(fontSize: 14.sp),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
    // ListTile(
    //   onTap: () {
    //     Get.toNamed(pageUrl);
    //   },
    //   tileColor: Colors.grey[200],
    //   leading: CircleAvatar(
    //     radius: Get.width * 0.06,
    //     backgroundColor: AppColors.settingItemColor,
    //     child: SvgPicture.asset(svgUrl!),
    //   ),
    //   title: Text(
    //     text!,
    //     style: TextStyle(fontSize: 20.sp),
    //   ),
    //   trailing: Container(
    //       height: Get.height * 0.06,
    //       width: Get.width * 0.08,
    //       decoration:
    //           BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
    //       child: Icon(Icons.arrow_forward_ios)),
    // );
  }
}
