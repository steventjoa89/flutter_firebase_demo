import 'package:get/get.dart';
import 'package:my_app/app/modules/push_notification/controllers/push_notification_controller.dart';

class PushNotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PushNotificationController());
  }
}
