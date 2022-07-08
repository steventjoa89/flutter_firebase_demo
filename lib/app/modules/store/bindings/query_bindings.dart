import 'package:get/get.dart';
import 'package:my_app/app/modules/store/controllers/store_controller.dart';

class StoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StoreController());
  }
}
