import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  final AuthRepository _repo = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  changePassword() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.changePassword(
        currentPasswordController.text, newPasswordController.text);
    if (appResponse.success!) {
      Get.back();
      CustomToasts.SuccessDialog("Password Changed Successfully");
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
