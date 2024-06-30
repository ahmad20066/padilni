import 'package:flutter/material.dart';
import 'package:padilni/models/notifications/notification_model.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.notifications),
          title: Text(notifications[index].title),
          subtitle: Text(notifications[index].body),
        );
      },
    );
  }
}
