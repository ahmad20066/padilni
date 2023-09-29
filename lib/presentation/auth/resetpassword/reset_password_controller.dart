import 'package:get/get.dart';
import 'package:padilni/data/repositories/login_repository.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  Rx<RequestStatus> forgotPasswordStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> verifyStatus = RequestStatus.begin.obs;
  LoginRepository _repo = LoginRepository();
  forgotPassword(String email) async {
    forgotPasswordStatus(RequestStatus.loading);
    final appResponse = await _repo.forgotPassword(email);
    if (appResponse.success!) {
      forgotPasswordStatus(RequestStatus.success);
      // Get.toNamed(AppRoutes.newPassword);
    } else {
      forgotPasswordStatus(RequestStatus.onerror);
      Get.snackbar("Error", appResponse.errorMessage!);
    }
  }

  forgotPasswordVerify(String email, String code) async {
    verifyStatus(RequestStatus.loading);
    final appResponse = await _repo.forgetPasswordVerifyCode(email, code);
    if (appResponse.success!) {
      verifyStatus(RequestStatus.success);
      Get.toNamed(AppRoutes.newPassword,
          arguments: {"email": email, "code": code});
    } else {
      verifyStatus(RequestStatus.onerror);
      Get.snackbar("Error", appResponse.errorMessage!);
    }
  }
}
