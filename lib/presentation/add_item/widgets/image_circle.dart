import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';

class ImageCircle extends StatefulWidget {
  const ImageCircle({super.key});

  @override
  State<ImageCircle> createState() => _ImageCircleState();
}

class _ImageCircleState extends State<ImageCircle> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final imagePicker = ImagePicker();
        final pickedFile =
            await imagePicker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          setState(() {
            pickedImage = File(pickedFile.path);
            Get.find<AddItemController>().images.add(pickedImage!);
          });
        }
      },
      child: Container(
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
        child: pickedImage == null
            ? Text(
                "Add Image",
                textAlign: TextAlign.center,
              )
            : Image(image: FileImage(pickedImage!)),
      ),
    );
  }
}
