import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/item/item_model.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';

class AddItemController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<File> images = [];
  Rx<int?> selectedcategoryId = Rx<int?>(null);
  bool isEdit = false;
  Color? color;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final ItemsRepository _repo = ItemsRepository();
  @override
  void onInit() {
    isEdit = Get.arguments?['isEdit'] ?? false;

    if (isEdit) {
      final ItemModel editedItem = Get.arguments['item'];
      nameController.text = editedItem.name!;
      descriptionController.text = editedItem.description!;
      priceController.text = editedItem.price!.toString();
      selectedcategoryId.value = editedItem.sub_category_id!;
      color = Color.fromRGBO(221, 75, 57, 1);
    }
    super.onInit();
  }

  addItem() async {
    status(RequestStatus.loading);
    ItemModel addedItem = ItemModel(
      id: 1,
      name: nameController.text,
      description: descriptionController.text,
      sub_category_id: selectedcategoryId.value,
      main_image: images.first.path,
      images: images.map((e) => e.path).toList(),
      price: double.parse(priceController.text),
    );
    final appResponse = await _repo.addItem(addedItem);
    if (appResponse.success!) {
      status(RequestStatus.success);
      Get.back();
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  editItem() async {
    status(RequestStatus.loading);
    ItemModel editedItem = ItemModel(
      id: 1,
      name: nameController.text,
      description: descriptionController.text,
      sub_category_id: selectedcategoryId.value,
      main_image: images.first.path,
      images: images.map((e) => e.path).toList(),
      price: double.parse(priceController.text),
    );
    final appResponse = await _repo.editItem(editedItem);
    if (appResponse.success!) {
      status(RequestStatus.success);
      Get.back();
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }
}
