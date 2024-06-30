import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/controller/home_controller.dart';
import 'package:padilni/presentation/home/widgets/carousel/home_carousel.dart';
import 'package:padilni/presentation/home/widgets/categories/categories_list.dart';
import 'package:padilni/presentation/home/widgets/list/list.dart';
import 'package:padilni/presentation/home/widgets/sections_drop_down.dart';
import 'package:padilni/presentation/home/widgets/title_widget.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/body_container.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.getHomeInfo();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              switch (controller.bannerStatus.value) {
                case RequestStatus.loading:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Loader(),
                  );
                case RequestStatus.nodata:
                  return NoData();
                case RequestStatus.success:
                  return HomeCarousel(list: controller.bannerItems);
                default:
                  return Container();
              }
            }),
            BodyContainer(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                TitleWidget(title: "categories".tr),
                // SizedBox(
                //   height: Get.height * 0.01,
                // ),
                Obx(() {
                  switch (controller.homeStatus.value) {
                    case RequestStatus.loading:
                      return Padding(
                        padding: REdgeInsets.all(15),
                        child: Loader(),
                      );
                    case RequestStatus.nodata:
                      return NoData();
                    case RequestStatus.success:
                      return CategoriesList(categories: controller.categories);
                    default:
                      return Container();
                  }
                }),
                SectionsDropDown(),
                Obx(() {
                  switch (controller.itemsStatus.value) {
                    case RequestStatus.loading:
                      return Loader();
                    case RequestStatus.success:
                      return ListGrid(items: controller.items);
                    case RequestStatus.nodata:
                      return NoData();
                    default:
                      return SizedBox.shrink();
                  }
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
