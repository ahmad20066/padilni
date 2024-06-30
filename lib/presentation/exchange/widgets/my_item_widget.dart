import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/exchange/controllers/exchange_via_item_controller.dart';
import 'package:padilni/utils/colors.dart';

class MyItemWidget extends StatelessWidget {
  final ItemModel item;
  final bool isSelected;
  const MyItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.h,
      margin: REdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              item.images.first.image!,
            ),
            radius: 50.r,
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(item.title),
          Spacer(),
          Transform.scale(
            scale: 2,
            child: Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(Colors),
              value: isSelected,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.grey),
              onChanged: (bool? value) {
                if (value!) {
                  Get.find<ExchangeViaItemController>().selectItem(item.id);
                } else {
                  Get.find<ExchangeViaItemController>().unSelectItem();
                }
              },
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
