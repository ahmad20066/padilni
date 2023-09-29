import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';
import 'package:padilni/presentation/search/controllers/search_controller.dart';
import 'package:padilni/utils/widgets/body_container.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchScreenController controller = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeAppbar(text: "Search"),
          BodyContainer(
            initialSize: 0.8,
            maxSize: 0.85,
            minSize: 0.8,
            children: [
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return ListItem(product: controller.products[index]);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
