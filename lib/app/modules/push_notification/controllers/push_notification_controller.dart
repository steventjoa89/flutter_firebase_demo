import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationController extends GetxController {
  void subscribe() async {
    // print('subscribe');
    await FirebaseMessaging.instance.subscribeToTopic('steven');
  }
}
