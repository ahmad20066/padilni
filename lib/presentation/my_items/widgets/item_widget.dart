import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/item/item_model.dart';
import 'package:padilni/presentation/my_items/controllers/my_items_controller.dart';
import 'package:padilni/utils/colors.dart';

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
            // height: Get.height * 0.3,
            // width: Get.width,
            child: Image.network(
              item.main_image!,
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
                    item.name!,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
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
                      const CircleAvatar(
                        // radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit_square,
                          color: Color.fromRGBO(74, 75, 77, 1),
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
