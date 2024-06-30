import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padilni/data/repositories/profile_repository.dart';
import 'package:padilni/models/user/update_user_model.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/presentation/profile/controllers/profile_controller.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/utils.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class EditProfileController extends GetxController {
  UserModel? user;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  Rx<String> gender = ''.obs;
  File? image;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final ProfileRepository _repo = ProfileRepository();
  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  updateProfile() async {
    status(RequestStatus.loading);
    final model = UpdateUserModel(
        image: image?.path,
        name: nameController.text,
        phone: phoneController.text,
        birthdate: birthController.text,
        gender: gender.value);
    print(user);
    print(user!.id);
    final appResponse = await _repo.updateProfile(model, user!.id!);
    if (appResponse.success!) {
      Get.find<ProfileController>().getProfile();
      if (Get.isRegistered<MyOrdersController>()) {
        Get.find<MyOrdersController>().getSentOrders();
      }
      Get.back();
      CustomToasts.SuccessDialog("Profile Updated Successfully");
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  fillData() async {
    print(user!.image);
    if (user!.image != null) {
      image = await Utils.fileFromUrl(user!.image!);
      update();
    }
    if (user!.name != null) {
      nameController.text = user!.name!;
    }
    if (user!.phone != null) {
      phoneController.text = user!.phone!;
    }
    if (user!.birthdate != null) {
      birthController.text = user!.birthdate!;
    }
    gender.value = user!.gender == null ? "" : user!.gender!;
  }

  @override
  void onInit() {
    user = Get.arguments;
    fillData();
    super.onInit();
  }
}
