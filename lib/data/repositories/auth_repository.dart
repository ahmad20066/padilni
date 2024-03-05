import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/login/social_login.dart';
import 'package:padilni/utils/local/shared.dart';
import '../../models/app_response.dart';
import '../../models/user/user_model.dart';

class AuthRepository {
  Future<AppResponse> signUp(UserModel model) async {
    try {
      var appResponse = await DioHelper.post(
          url: SignUpApi, body: model.userRegisterToJson());
      return AppResponse(
          data: appResponse.data, success: true, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          data: null, success: false, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> verifyEmailAddress(UserModel model) async {
    try {
      var appResponse = await DioHelper.post(
          url: verifyemail, body: model.userVerifyToJson());
      return AppResponse(
          success: true, errorMessage: null, data: appResponse.data);
    } on DioException catch (e) {
      return AppResponse(
          success: false, errorMessage: e.message ?? e.toString(), data: null);
    }
  }

  Future<AppResponse> resendVerificationCode(String email) async {
    try {
      var appResponse =
          await DioHelper.post(url: resendCode, body: {"email": email});
      return AppResponse(
          success: true, errorMessage: null, data: appResponse.data);
    } on DioException catch (e) {
      return AppResponse(
          success: false, errorMessage: e.message ?? e.toString(), data: null);
    }
  }

  Future<AppResponse> login(UserModel model) async {
    try {
      final response =
          await DioHelper.post(url: loginUrl, body: model.loginToJSon());
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> forgotPassword(String email) async {
    try {
      final response =
          await DioHelper.post(url: forgotPasswordUrl, body: {"email": email});
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> logout() async {
    try {
      print("aaaa");
      final response = await DioHelper.post(
          url: logoutUrl,
          body: {"device_uuid": Shared.getstring("uuid")!},
          token: Shared.getstring("token"));
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> forgetPasswordVerifyCode(
      String email, String code) async {
    try {
      final response = await DioHelper.post(
          url: verifyForgotPasswordUrl, body: {"email": email, "code": code});
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> forgotPasswordChange(UserModel model) async {
    try {
      final response =
          await DioHelper.post(url: forgotPasswordChangeUrl, body: {
        "email": model.email,
        "password": model.password,
      });
      print(response.data);
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> socialLogin(SocialLoginModel model) async {
    try {
      final response =
          await DioHelper.post(url: socialLoginUrl, body: model.toMap());
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
