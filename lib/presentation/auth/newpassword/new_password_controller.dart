import 'dart:io';

import 'package:get/get.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/success_dialog.dart';

class NewPasswordController extends GetxController {
  String? email;
  Rx<RequestStatus> status = RequestStatus.begin.obs;

  final AuthRepository _repo = AuthRepository();
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  changePassword(String password) async {
    status(RequestStatus.loading);
    final model = UserModel(
      email: email!,
      password: password,
      // device_type: deviceType,
      // device_uuid: Shared.getstring("uuid"),
      // notification_token: Shared.getstring("fcm_token")!
    );
    final appResponse = await _repo.forgotPasswordChange(model);
    if (appResponse.success!) {
      status(RequestStatus.success);
      await successDialog("Password Changed Successfully");
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.snackbar("Error", appResponse.errorMessage!);
      status(RequestStatus.onerror);
    }
  }
}
