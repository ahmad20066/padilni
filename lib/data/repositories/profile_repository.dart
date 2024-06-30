import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/models/app_response.dart';
import 'package:padilni/models/user/update_user_model.dart';
import 'package:padilni/models/user/user_model.dart';

class ProfileRepository {
  Future<AppResponse> getNotifications() async {
    try {
      final response = await DioHelper.get(
        url: notificationsUrl,
        token: Shared.getstring("token")!,
      );
      print(response.data);
      return AppResponse(success: true, data: response.data['data']);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }

  Future<AppResponse> updateProfile(UpdateUserModel model, int id) async {
    try {
      final response = await DioHelper.post(
          url: "$updateProfileUrl/$id",
          token: Shared.getstring("token"),
          body: FormData.fromMap(await model.toMap()));
      return AppResponse(success: true, data: response.data);
    } on DioException catch (e) {
      return AppResponse(success: false, errorMessage: e.message);
    }
  }
}
