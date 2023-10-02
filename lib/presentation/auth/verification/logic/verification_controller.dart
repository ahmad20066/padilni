import 'dart:io';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:padilni/models/user/user_model.dart';
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

  Future<void> verifyemailAddress({String? code, String? email}) async {
    String uuid = Shared.getstring("uuid")!;
    String deviceType = deviceTypeSelected();
    UserModel model = UserModel(
        email: email, deviceType: deviceType, deviceToken: "988", uuid: uuid);

    var response = await _authRepository.verifyEmailAddress(model);

    if (response.success!) {
      print("hello from success");
    } else if (!response.success!) {
      print("hello from fail");
    }
  }
}
