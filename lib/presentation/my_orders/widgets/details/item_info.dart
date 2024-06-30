import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/colors.dart';

class ItemInfo extends StatelessWidget {
  final ItemModel? item;
  const ItemInfo({super.key, required this.item});
  Widget buildInfoRow(String title, String value) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          SizedBox(
            width: 70.w,
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              title,
              style: const TextStyle(color: AppColors.textGreyColor),
            ),
          ),
          SizedBox(
            width: 150.w,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imagesBaseUrl + item!.images.first!.image!,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          buildInfoRow("title".tr, item!.title),
          buildInfoRow("category".tr, item!.category ?? " "),
          buildInfoRow("description".tr, item!.description),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}
