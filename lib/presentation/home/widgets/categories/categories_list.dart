import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/presentation/home/widgets/categories/category_widget.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoriesModel> categories;
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      child: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: Get.width * 0.1),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CategoryWidget(category: categories[index]);
        },
      ),
    );
  }
}
