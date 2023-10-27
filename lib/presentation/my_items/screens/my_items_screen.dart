import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/presentation/my_items/widgets/items_list.dart';
import 'package:padilni/utils/widgets/add_floating_button.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_search_bar.dart';

class MyItemsScreen extends StatelessWidget {
  const MyItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddFloatingButton(onTap: () {}),
      appBar: const CustomAppBar(
        text: "My Items",
        showHomeIcon: false,
      ),
      body: Stack(
        children: [
          ItemsList(products: [
            ProductModel(
                id: 1,
                name: "Market",
                image:
                    "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg",
                type: "Food"),
            ProductModel(
                id: 1,
                name: "Box",
                image:
                    "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
                type: "Stuff"),
            ProductModel(
                id: 1,
                name: "Box",
                image:
                    "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
                type: "Stuff"),
            ProductModel(
                id: 1,
                name: "Box",
                image:
                    "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
                type: "Stuff"),
            ProductModel(
                id: 1,
                name: "Box",
                image:
                    "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
                type: "Stuff"),
            ProductModel(
                id: 1,
                name: "Box",
                image:
                    "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
                type: "Stuff"),
          ]),
          Container(
            height: Get.height * 0.17,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      spreadRadius: 10,
                      blurRadius: 10)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSearchBar(
                  onChanged: (v) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
