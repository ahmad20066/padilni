import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherConfig {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  pusherGet(Function(dynamic e) onEvent, int exchangeId, int userId) async {
    await pusher.init(
        apiKey: "ff136fb6794779ad1d7e",
        cluster: "ap2",
        pongTimeout: 5000000,
        onConnectionStateChange: onConnectionStateChange,
        onSubscriptionError: onSubscriptionError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (e) {
          print(e);
        });

    await pusher.subscribe(
        channelName: 'conversation.$exchangeId.$userId', onEvent: onEvent);
    await pusher.connect();
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {}

  void onSubscriptionError(String message, dynamic e) {}

  void onMemberRemoved(String channelName, PusherMember member) {}

  void onConnectionStateChange(
      dynamic currentState, dynamic previousState) async {
    print(currentState);
  }

  Future<void> closeConnection() async {
    await pusher.disconnect();
  }
}
