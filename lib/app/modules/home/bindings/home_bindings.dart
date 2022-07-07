import 'package:get/get.dart';
import 'package:my_app/app/modules/add-product/controllers/add_product_controller.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
