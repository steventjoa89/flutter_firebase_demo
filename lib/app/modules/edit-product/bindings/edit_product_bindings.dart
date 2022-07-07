import 'package:get/get.dart';
import 'package:my_app/app/modules/edit-product/controllers/edit_product_controller.dart';

class EditProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EditProductController());
  }
}
