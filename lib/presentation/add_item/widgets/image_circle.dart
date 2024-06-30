import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';

class ImageCircle extends StatelessWidget {
  final AddImage image;

  ImageCircle({required this.image});

  final controller = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await controller.pickImage(true, replacedImage: image);
          },
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 3)
                ]),
            child: Image.file(image.imageFile!),
          ),
        ),
        IconButton(
          onPressed: () {
            controller.removeImage(image);
          },
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}
