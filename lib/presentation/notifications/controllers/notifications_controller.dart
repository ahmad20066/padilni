import 'package:get/get.dart';
import 'package:padilni/data/repositories/profile_repository.dart';
import 'package:padilni/models/notifications/notification_model.dart';
import 'package:padilni/utils/request_status.dart';

class NotificationsController extends GetxController {
  List<NotificationModel> notifications = [];
  final ProfileRepository _repo = ProfileRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  getNotifications() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.getNotifications();
    if (appResponse.success!) {
      notifications = (appResponse.data as List)
          .map((e) => NotificationModel.fromMap(e))
          .toList();
      if (notifications.isEmpty) {
        status(RequestStatus.nodata);
      } else {
        status(RequestStatus.success);
      }
    } else {
      status(RequestStatus.onerror);
    }
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
