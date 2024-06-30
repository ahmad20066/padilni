import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/message/message_model.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/pusher.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class ChatController extends GetxController {
  OrderModel? order;
  bool isSend = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool canSend = false.obs;
  TextEditingController messageController = TextEditingController();
  RxList<MessageModel> messages = <MessageModel>[].obs;
  ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  Rx<RequestStatus> sendStatus = RequestStatus.begin.obs;
  UserModel? otherUser;
  UserModel? user;
  final pusher = PusherConfig();

  sendMessage() async {
    sendStatus(RequestStatus.loading);
    final message = MessageModel(
        id: 0,
        body: messageController.text,
        created_at: DateTime.now().toIso8601String(),
        to: isSend ? order!.exchange_user.id! : order!.owner_user.id!,
        exchange_id: order!.id,
        sent: false,
        is_mine: true);
    print(message.created_at);
    messages.add(message);
    final appResponse = await _repo.sendMessage(message);
    if (appResponse.success!) {
      messageController.clear();
      canSend(false);
      message.sent = true;
      status(RequestStatus.success);
      update();
    } else {
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  getMessages() async {
    status(RequestStatus.loading);
    final appResponse = await _repo.getConversation(order!.id);
    if (appResponse.success!) {
      messages.value = (appResponse.data as List)
          .map((e) => MessageModel.fromMap(e))
          .toList();
      if (messages.isEmpty) {
        status(RequestStatus.nodata);
      } else {
        status(RequestStatus.success);
      }
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  @override
  void onInit() {
    order = Get.arguments['order'];
    isSend = Get.arguments['isSend'];
    otherUser = isSend ? order!.owner_user : order!.exchange_user;
    user = !isSend ? order!.owner_user : order!.exchange_user;
    getMessages();
    pusher.closeConnection();

    pusher.pusherGet((e) {
      print(e.data);
      print(messages.length);
      // if(jsonDecode(e.data)['message'])
      messages.insert(
          messages.length, MessageModel.fromMap(jsonDecode(e.data)['message']));
      print(messages.length);
    }, order!.id, user!.id!);
    super.onInit();
  }

  @override
  void dispose() {
    pusher.closeConnection();
    super.dispose();
  }
}
