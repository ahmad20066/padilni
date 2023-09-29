import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';

class ListGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ListGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: Get.width * 0.03),
        itemBuilder: (context, index) => ListItem(
          product: products[index],
        ),
      ),
    );
  }
}
