import 'package:get/get.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class ProfileController extends GetxController {
  AuthRepository _authRepo = AuthRepository();
  logout() async {
    final appResponse = await _authRepo.logout();
    if (appResponse.success!) {
      Get.offAllNamed(AppRoutes.login);
      Shared.setstring("token", "");
    } else {
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }
}
