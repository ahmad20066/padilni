import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/models/login/social_login.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  var requeststatus = RequestStatus.begin.obs;

  setRequestStatus(RequestStatus status) => requeststatus.value = status;

  Future<void> userRegister(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    setRequestStatus(RequestStatus.loading);
    Shared.setstring("email", email);
    UserModel userModel = UserModel(
      email: email,
      password: password,
      phone: phone,
      // notification_token: Shared.getstring("fcm_token")!,
      name: name,
      // device_uuid: Shared.getstring("uuid")!
    );
    var response = await _authRepository.signUp(userModel);

    if (response.success!) {
      setRequestStatus(RequestStatus.success);
      debugPrint("pravo");

      Get.toNamed("/verification", arguments: email);
    } else {
      setRequestStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(response.errorMessage!);
    }
  }
}
