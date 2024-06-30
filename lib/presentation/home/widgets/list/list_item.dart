import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/wishlist/controllers/wishlist_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/triangle_button.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ListItem extends StatelessWidget {
  final ItemModel item;
  const ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // print(item.status);
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen, arguments: {
          "id": item.id,
          "fromWishlist": false,
        });
      },
      child: SizedBox(
        // alignment: Alignment.center,
        height: 224.h,
        width: 168.w,
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.passthrough,
          children: [
            Card(
              surfaceTintColor: Colors.white,
              semanticContainer: false,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.025)),
              elevation: 6,
              child: Container(
                height: 164.h,
                width: 158.w,
                // padding: EdgeInsets.all(Get.width * 0.02),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        imagesBaseUrl + item.images.first.image!,
                        height: 87.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          item.title!,
                          style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          item.status,
                          style: TextStyle(fontSize: Get.width * 0.025),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: -20.w,
                bottom: 0.w,
                // alignment: Alignment(1, 0.3),
                // width: 200.w,
                child: Container(
                  height: 40.h,
                  width: 158.w,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 12.h,
                        right: 40.w,
                        child: Container(
                          alignment: Alignment.center,
                          height: 19.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.secondaryColor,
                          ),
                          child: Text(
                            "exchange".tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                      ),
                      GetBuilder<WishListController>(
                          init: WishListController(),
                          builder: (_) {
                            return Positioned(
                                right: 25.w,
                                bottom: 5.h,
                                child: TriangleButton(
                                  isFavorite: Get.find<WishListController>()
                                      .checkIfFavorite(item.id),
                                  onTap: () {
                                    Get.find<WishListController>()
                                        .addToFavorites(item);
                                  },
                                ));
                          }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
