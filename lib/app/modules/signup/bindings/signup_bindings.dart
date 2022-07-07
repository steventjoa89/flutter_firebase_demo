import 'package:get/get.dart';
import 'package:my_app/app/modules/signup/controllers/signup_controller.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
