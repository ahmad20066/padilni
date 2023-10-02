import 'dart:io';

import 'package:get/get.dart';
import 'package:padilni/data/repositories/login_repository.dart';
import 'package:padilni/models/login/login_model.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/success_dialog.dart';

class NewPasswordController extends GetxController {
  String? email;
  String? code;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  LoginRepository _repo = LoginRepository();
  @override
  void onInit() {
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    super.onInit();
  }

  changePassword(String password) async {
    status(RequestStatus.loading);
    final deviceType = Platform.isAndroid ? "android" : "ios";
    print(email);
    final model = LoginModel(
        email: email!,
        password: password,
        device_type: deviceType,
        device_uuid: 11,
        notification_token: Shared.getstring("token")!);
    final appResponse = await _repo.forgotPasswordChange(model, code!);
    if (appResponse.success!) {
      Shared.setstring(
          "token", appResponse.data['data']['token_info']['access_token']);
      status(RequestStatus.success);
      await successDialog("Password Changed Successfully");
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.snackbar("Error", appResponse.errorMessage!);
      status(RequestStatus.onerror);
    }
  }
}
