import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/notifications/widgets/notifications_container.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: CustomAppBar(text: "Notifications".tr , 
      showHomeIcon: false,
      ), 
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context , index)=> const NotificationContainer()),

    );
  }
}