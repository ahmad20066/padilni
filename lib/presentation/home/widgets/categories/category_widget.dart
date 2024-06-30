import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class CategoryWidget extends StatelessWidget {
  final CategoriesModel category;
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.subCategories, arguments: category.id);
      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 87.w,
              width: 87.w,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(145, 67, 255, 0.2),
                  borderRadius: BorderRadius.circular(14)),
              child: Image.network(category.image),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              category.title,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
