import 'package:get/get.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/data/repositories/profile_repository.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/user/update_user_model.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class ProfileController extends GetxController {
  AuthRepository _authRepo = AuthRepository();
  ProfileRepository _repo = ProfileRepository();
  UserModel? user;
  Rx<RequestStatus> profileStatus = RequestStatus.begin.obs;
  Rx<RequestStatus> langStatus = RequestStatus.begin.obs;
  getProfile() async {
    profileStatus(RequestStatus.loading);
    final appResponse = await _authRepo.getProfile();
    if (appResponse.success!) {
      user = UserModel.fromMap(appResponse.data);
      print(user!.toMap());
      profileStatus(RequestStatus.success);
    } else {
      profileStatus(RequestStatus.onerror);
    }
  }

  updateLanguage(String lang) async {
    langStatus(RequestStatus.loading);
    final model = UpdateUserModel(language: lang);
    print(user);
    print(user!.id);
    final appResponse = await _repo.updateProfile(model, user!.id!);
    if (appResponse.success!) {
      langStatus(RequestStatus.success);
    } else {
      langStatus(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  logout() async {
    final appResponse = await _authRepo.logout();
    if (appResponse.success!) {
      Get.offAllNamed(AppRoutes.login);
      Shared.setstring("token", "");
    } else {
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
