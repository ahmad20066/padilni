import 'package:get/get.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    onchangesplashstate();
    super.onInit();
  }

  var requeststatus = RequestStatus.begin.obs;

  setrequeststatus(RequestStatus status) => requeststatus.value = status;

  onchangesplashstate() async {
    print("****************");
    print(Shared.getBool("rememberMe"));
    await Future.delayed(const Duration(seconds: 4));
    if (Shared.getstring("token") != null &&
        Shared.getstring("token")!.isNotEmpty) {
      if (Shared.getBool("rememberMe") == null) {
        Shared.setBool("rememberMe", false);
      } else {
        if (Shared.getBool("rememberMe")!) {
          Get.offAllNamed(AppRoutes.main);
        } else {
          Shared.setstring("token", "");
          Get.offAllNamed(AppRoutes.login);
        }
      }
    } else {
      if (Shared.getBool("firstTime") == null) {
        Shared.setBool("firstTime", true);
        Get.offAllNamed("/onboarding");
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    }
  }
}
