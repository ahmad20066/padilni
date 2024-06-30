import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/presentation/main_screen/controller/navbar_controller.dart';
import 'package:padilni/presentation/main_screen/screen/main_screen.dart';
import 'package:padilni/presentation/my_orders/controllers/my_orders_controller.dart';
import 'package:padilni/presentation/my_orders/screens/my_order_details_screen.dart';

import '../utils/routes/app_routes.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("****************");
  print(message.data);
}

class NotificationConfig {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.defaultImportance);

  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint("fcm : $fcmToken");

    Shared.setstring("fcm_token", fcmToken!);

    await initPushNotification();
    await initLocalNotifications();
  }

  void handlemessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    String type = message!.data['type'];
    if (type == "exchange" || type == 'accept_exchange' || type == "message") {
      final arguments = {
        "id": int.parse(message.data['exchange_id']),
        "isChat": type == "message"
      };
      if (Get.isRegistered<MyOrdersController>()) {
        final orderscontroller = Get.find<MyOrdersController>();
        Get.to(() => MainScreen(), arguments: arguments);
        Get.find<NavbarController>().currentIndex.value = 2;
        if (type == "exchange") {
          orderscontroller.getMyOrders();
          orderscontroller.getSentOrders();
        }
      } else {
        Get.to(() => MainScreen(), arguments: arguments);
        Get.find<NavbarController>().currentIndex.value = 2;
      }
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handlemessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handlemessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((event) {
      print(event.toMap());
      final notification = event.notification;

      if (notification == null) {
        return;
      }

      _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(event.toMap()));
    });
  }

  Future<void> initLocalNotifications() async {
    const settings = InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('@drawable/ic_launcher'));

    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        handlemessage(message);
      },
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }
}
