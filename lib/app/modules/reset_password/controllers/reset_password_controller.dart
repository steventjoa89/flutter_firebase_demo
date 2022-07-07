import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends GetxController {
  final emailC = TextEditingController(text: 'steventjoa89@gmail.com');

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
