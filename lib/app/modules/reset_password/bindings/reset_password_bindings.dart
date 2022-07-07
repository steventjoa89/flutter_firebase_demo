import 'package:get/get.dart';
import 'package:my_app/app/modules/reset_password/controllers/reset_password_controller.dart';

class ResetPasswordBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController());
  }
}
