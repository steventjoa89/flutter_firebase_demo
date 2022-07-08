import 'package:get/get.dart';
import 'package:my_app/app/modules/query/controllers/query_controller.dart';

class QueryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QueryController());
  }
}
