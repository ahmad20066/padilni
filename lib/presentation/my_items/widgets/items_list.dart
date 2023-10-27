import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/presentation/my_items/widgets/item_widget.dart';

class ItemsList extends StatelessWidget {
  List<ProductModel> products = [];
  ItemsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: Get.height * 0.14),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemWidget(
          product: products[index],
        );
      },
    );
  }
}
