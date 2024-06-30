import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/wishlist/controllers/wishlist_controller.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class WishlistWidget extends StatelessWidget {
  final ItemModel item;
  const WishlistWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen,
            arguments: {"id": item.id, "fromWishlist": true});
      },
      child: Card(
        margin: REdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        surfaceTintColor: Colors.white,
        semanticContainer: false,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(41)),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Image.network(
                  imagesBaseUrl + item.images.first.image!,
                  height: 200.h,
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
                  IconButton(
                      onPressed: () {
                        Get.find<WishListController>().addToFavorites(item);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
