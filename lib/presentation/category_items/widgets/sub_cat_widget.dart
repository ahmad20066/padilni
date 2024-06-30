import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:padilni/models/categories/sub_category_model.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class SubCategoryWidget extends StatelessWidget {
  final SubCategoryModel subCategory;
  const SubCategoryWidget({
    Key? key,
    required this.subCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.categoryItemsRoute, arguments: subCategory.id);
      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: Get.height * 0.1,
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(145, 67, 255, 0.2),
                  borderRadius: BorderRadius.circular(14)),
              child: Image.network(subCategory.image),
            ),
            Text(
              subCategory.title,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
      ),
    );
    ;
  }
}
