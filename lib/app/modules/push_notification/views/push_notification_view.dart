import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/push_notification/controllers/push_notification_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationView extends GetView<PushNotificationController> {
  // @override
  // void initState() async {
  //   await FirebaseMessaging.instance.subscribeToTopic('steven');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Push Notif', style: TextStyle(fontSize: 20)),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.subscribe()),
    );
  }
}
