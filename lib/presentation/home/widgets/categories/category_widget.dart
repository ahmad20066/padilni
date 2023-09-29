import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:padilni/models/categories/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoriesModel category;
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: Get.height * 0.1,
          width: Get.width * 0.2,
          decoration: BoxDecoration(
              color: Color.fromRGBO(145, 67, 255, 0.2),
              borderRadius: BorderRadius.circular(14)),
          child: Image.network(category.image),
        ),
        Text(
          category.name,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
        )
      ],
    );
  }
}
