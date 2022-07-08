import 'package:get/get.dart';
import 'package:my_app/app/modules/file-upload/controllers/file_upload_controller.dart';

class FileUploadBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FileUploadController());
  }
}
