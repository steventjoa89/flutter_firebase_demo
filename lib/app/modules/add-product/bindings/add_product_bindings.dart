import 'package:get/get.dart';
import 'package:my_app/app/modules/add-product/controllers/add_product_controller.dart';

class AddProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddProductController());
  }
}
