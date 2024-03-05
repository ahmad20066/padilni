import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/models/login/social_login.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/methods/device_type.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/routes/app_routes.dart';

class LoginController extends GetxController {
  RxBool rememberMePressed = false.obs;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  setRequestStatus(RequestStatus reqstatus) => status.value = reqstatus;

  final AuthRepository _repo = AuthRepository();
  onRemebermePressed() {
    rememberMePressed.value = !rememberMePressed.value;
  }

  login(String email, String password) async {
    status(RequestStatus.loading);
    final deviceType = deviceTypeSelected();
    print(rememberMePressed.value);
    final model = UserModel(
        email: email,
        password: password,
        device_type: deviceType,
        notification_token: Shared.getstring("fcm_token")!,
        device_uuid: Shared.getstring("uuid")!);

    final appResponse = await _repo.login(model);
    if (appResponse.success!) {
      Shared.setstring("token", appResponse.data['data']['access_token']);
      if (rememberMePressed.isTrue) {
        print("-----------");
        Shared.setBool("rememberMe", true);
      } else {
        Shared.setBool("rememberMe", false);
      }
      print(Shared.getBool("rememberMe"));
      status(RequestStatus.success);
      Get.offAllNamed(AppRoutes.main);
    } else {
      status(RequestStatus.onerror);
      if (appResponse.errorMessage!.contains("not verified")) {
        Get.toNamed(AppRoutes.verificationCode, arguments: email);
      }
      Get.snackbar("Error Logging In", appResponse.errorMessage!);
    }
  }

  Future<void> facebookRegister(
      {required String email,
      required String social_id,
      required String name}) async {
    setRequestStatus(RequestStatus.loading);
    SocialLoginModel model = SocialLoginModel(
        name: name,
        email: email,
        signup_method: "facebook",
        social_id: social_id,
        device_type: Platform.isAndroid ? "android" : "ios",
        device_uuid: Shared.getstring("uuid")!,
        notification_token: Shared.getstring("fcm_token")!);
    var response = await AuthRepository().socialLogin(model);

    if (response.success!) {
      Shared.setstring(
          "token", response.data['data']['token_info']['access_token']);
      status(RequestStatus.success);
      Get.offAllNamed(AppRoutes.main);
    } else {
      setRequestStatus(RequestStatus.onerror);
      Get.snackbar("Error Logging In", response.errorMessage!);
    }
  }

  facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(loginBehavior: LoginBehavior.webOnly);
      print(result);
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        // final OAuthCredential credential =
        //     FacebookAuthProvider.credential(result.accessToken!.token);
        // print(credential.token);
        // final userData = await FacebookAuth.instance.getUserData();
        // print(userData);
        // await facebookRegister(
        //     email: userData['email'],
        //     name: userData['name'],
        //     social_id: credential.token.toString());
        // // Once signed in, return the UserCredential

        // return await FirebaseAuth.instance.signInWithCredential(credential);
      }

      return null;
    } catch (e) {
      print('--------------');
      print(e.toString());
    }
  }

  Future<void> googleRegister(
      {required String email,
      required String social_id,
      required String name}) async {
    setRequestStatus(RequestStatus.loading);
    SocialLoginModel model = SocialLoginModel(
        name: name,
        email: email,
        signup_method: "gmail",
        social_id: social_id,
        device_type: Platform.isAndroid ? "android" : "ios",
        device_uuid: Shared.getstring("uuid")!,
        notification_token: "123");
    var response = await AuthRepository().socialLogin(model);

    if (response.success!) {
      print("----------------------");
      print(response.data);
      Shared.setstring(
          "token", response.data['data']['token_info']['access_token']);
      print(Shared.getstring("token"));
      status(RequestStatus.success);
      Get.offAllNamed(AppRoutes.main);

      // Get.toNamed(App);
    } else {
      setRequestStatus(RequestStatus.onerror);
      Get.snackbar("Error Logging In", response.errorMessage!);
    }
  }

  // Future<UserCredential> googlelogin() async {
  //   // await GoogleSignIn().disconnect();
  //   // await FirebaseAuth.instance.signOut();
  //   // trigger the authentication flow :
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // obtain the auth details from the request :
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // create new credentials :
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //   if (googleUser != null) {
  //     await googleRegister(
  //         email: googleUser!.email,
  //         social_id: credential.token.toString(),
  //         name: googleUser!.displayName!);
  //   }

  //   // once signed in :

  //   return FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
