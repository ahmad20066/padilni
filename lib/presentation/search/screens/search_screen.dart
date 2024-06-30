import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';
import 'package:padilni/presentation/search/controllers/search_controller.dart';
import 'package:padilni/presentation/search/widgets/location_filter_widget.dart';
import 'package:padilni/presentation/search/widgets/status_filter_widget.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/body_container.dart';
import 'package:padilni/utils/widgets/custom_search_bar.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchScreenController controller = Get.put(SearchScreenController());
    return RefreshIndicator(
      onRefresh: () async {
        controller.clearFilters();
        await controller.searchItems();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            HomeAppbar(
              text: "search".tr,
              color: AppColors.secondaryColor,
            ),
            BodyContainer(
              initialSize: 0.87,
              maxSize: 0.92,
              minSize: 0.87,
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomSearchBar(
                  onChanged: (v) {
                    controller.searchItems();
                  },
                  controller: controller.searchController,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.2,
                    ),
                    Chip(
                      padding: REdgeInsets.only(bottom: 3.h),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/icons/filter.png"),
                            color: Colors.white,
                          ),
                          Text(
                            "filters".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      backgroundColor: AppColors.fifthcolor,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                        // height: 10,
                      ),
                    ),
                  ],
                ),
                StatusFilterWidget(),
                LocationFilterWidget(),
                Obx(() {
                  switch (controller.status.value) {
                    case RequestStatus.loading:
                      return Loader();
                    case RequestStatus.nodata:
                      return NoData();
                    case RequestStatus.success:
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.items.length,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    // mainAxisSpacing: 20.h,
                                    childAspectRatio: 1.2,
                                    crossAxisSpacing: 5.w),
                            itemBuilder: (context, index) {
                              return ListItem(item: controller.items[index]);
                            }),
                      );
                    default:
                      return SizedBox.shrink();
                  }
                }),
                SizedBox(
                  height: 200.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
