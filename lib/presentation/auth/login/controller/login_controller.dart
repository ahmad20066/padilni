import 'dart:io';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/login_repository.dart';
import 'package:padilni/models/login/login_model.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class LoginController extends GetxController {
  RxBool rememberMePressed = false.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  LoginRepository _repo = LoginRepository();
  onRemebermePressed() {
    rememberMePressed.value = !rememberMePressed.value;
  }

  login(String email, String password) async {
    status(RequestStatus.loading);
    final deviceType = Platform.isAndroid ? "android" : "ios";
    final model = UserModel(
        email: email,
        password: password,
        device_type: deviceType,
        notification_token: Shared.getstring("fcm_token")!,
        device_uuid: Shared.getstring("uuid")!);
      
    final appResponse = await _repo.login(model);
    if (appResponse.success!) {
      Shared.setstring(
          "token", appResponse.data['data']['token_info']['access_token']);
      status(RequestStatus.success);
      Get.offAllNamed(AppRoutes.main);
    } else {
      status(RequestStatus.onerror);
      Get.snackbar("Error Logging In", appResponse.errorMessage!);
    }
  }
}
