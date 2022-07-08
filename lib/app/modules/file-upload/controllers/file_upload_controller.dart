import 'dart:io';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  fs.FirebaseStorage storage = fs.FirebaseStorage.instance;

  void uploadFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      result.files.forEach((el) async {
        File file = File(el.path!);
        try {
          await fs.FirebaseStorage.instance.ref('${el.name}').putFile(file);
        } on fs.FirebaseException catch (e) {
          print(e);
        }
      });
    }

    // if (result != null) {
    //   String filename = result.files.first.name;

    //   File file = File(result.files.single.path!);

    //   try {
    //     await fs.FirebaseStorage.instance.ref('$filename').putFile(file);
    //     print('Berhasil upload file');
    //   } on fs.FirebaseException catch (e) {
    //     print(e);
    //   }
    // } else {
    //   // User canceled the picker
    //   print('User batal pilih');
    // }
  }
}
