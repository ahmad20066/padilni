import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/login/login_model.dart';
import 'package:padilni/models/login/social_login.dart';
import 'package:padilni/models/user/user_model.dart';

class LoginRepository {
  Future<AppResponse> login(UserModel model) async {
    try {
      final response = await DioHelper.post(url: loginUrl, body: model.loginToJSon());
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

  Future<AppResponse> forgotPasswordChange(
      LoginModel model, String code) async {
    try {
      final response = await DioHelper.post(
          url: forgotPasswordChangeUrl, body: {...model.toMap(), "code": code});
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> socialLogin(SocialLoginModel model) async {
    try {
      final response = await DioHelper.post(
          url: forgotPasswordChangeUrl, body: model.toMap());
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
