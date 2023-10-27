import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<int?> selectedcategoryId = Rx<int?>(null);
}
