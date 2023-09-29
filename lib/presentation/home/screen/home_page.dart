import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/presentation/home/controller/home_controller.dart';
import 'package:padilni/presentation/home/widgets/carousel/home_carousel.dart';
import 'package:padilni/presentation/home/widgets/categories/categories_list.dart';
import 'package:padilni/presentation/home/widgets/list/list.dart';
import 'package:padilni/presentation/home/widgets/title_widget.dart';
import 'package:padilni/utils/widgets/body_container.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeCarousel(list: controller.bannerItems),
          BodyContainer(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              TitleWidget(title: "Categories"),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CategoriesList(categories: controller.categories),
              TitleWidget(title: "List"),
              ListGrid(products: [
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
              ])
            ],
          )
        ],
      ),
    );
  }
}
