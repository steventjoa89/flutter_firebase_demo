import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/file-upload/controllers/file_upload_controller.dart';

class FileUploadView extends GetView<FileUploadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('File Upload'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.uploadFile();
        },
      ),
    );
  }
}
