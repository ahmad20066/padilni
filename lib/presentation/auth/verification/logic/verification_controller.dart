import 'dart:io';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';
import '../../../../utils/methods/device_type.dart';

class VerifacationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  Future<String> getDeviceUUID() async {
    String deviceId = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Retrieve the Android device UUID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!; // Retrieve the iOS device UUID
    }

    return deviceId;
  }

  var verifyRequstStatus = RequestStatus.begin.obs;
  var resendRequstStatus = RequestStatus.begin.obs;

  changeRequestStatus(RequestStatus status) =>
      verifyRequstStatus.value = status;
  changeResendRequestStatus(RequestStatus status) =>
      resendRequstStatus.value = status;

  Future<void> verifyemailAddress({String? code, String? email}) async {
    changeRequestStatus(RequestStatus.loading);
    String deviceType = deviceTypeSelected();
    UserModel model = UserModel(
      email: Get.arguments,
      // device_type: deviceType,
      code: code,
      // notification_token: Shared.getstring("fcm_token"),
      // device_uuid:Shared.getstring("uuid")!
    );

    var response = await _authRepository.verifyEmailAddress(model);

    if (response.success!) {
      changeRequestStatus(RequestStatus.success);
      Get.offAllNamed("/main");
    } else if (!response.success!) {
      print(response.errorMessage);

      Get.snackbar("Error", "failed to verify!");
      changeRequestStatus(RequestStatus.onerror);
    }
  }

  Future<void> resendCode() async {
    changeResendRequestStatus(RequestStatus.loading);

    var response = await _authRepository.resendVerificationCode(Get.arguments);

    if (response.success!) {
      changeResendRequestStatus(RequestStatus.success);
      CustomToasts.SuccessDialog("Code Resent");
    } else if (!response.success!) {
      print(response.errorMessage);

      Get.snackbar("Error", "failed to verify!");
      changeResendRequestStatus(RequestStatus.onerror);
    }
  }
}
