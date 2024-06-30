import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/notifications/controllers/notifications_controller.dart';
import 'package:padilni/presentation/notifications/widgets/noitifcations_list.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "notifications".tr,
        hasHomeIcon: false,
      ),
      body: Obx(() {
        switch (controller.status.value) {
          case RequestStatus.loading:
            return Loader();
          case RequestStatus.nodata:
            return NoData();
          case RequestStatus.success:
            return NotificationsList(notifications: controller.notifications);
          default:
            return SizedBox.shrink();
        }
      }),
    );
  }
}
