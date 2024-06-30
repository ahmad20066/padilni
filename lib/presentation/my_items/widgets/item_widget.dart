import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/my_items/controllers/my_items_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      height: Get.height * 0.3,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.3,
            width: Get.width,
            child: Image.network(
              imagesBaseUrl + item.images.first.image!,
              // height: Get.height * 0.15,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                  ),
                  Text(
                    item.title!,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: Get.height * 0.06,
                    width: Get.width * 0.35,
                    decoration: const BoxDecoration(
                        color: AppColors.fifthcolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40))),
                    child: Row(children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.addItem,
                              arguments: {'isEdit': true, 'item': item});
                        },
                        child: const CircleAvatar(
                          // radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.edit_square,
                            color: Color.fromRGBO(74, 75, 77, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<MyItemsController>().deleteItem(item.id);
                        },
                        child: const CircleAvatar(
                          // radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.delete_forever,
                            color: Color.fromRGBO(74, 75, 77, 1),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
