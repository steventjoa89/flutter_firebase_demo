import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController(text: 'steventjoa89@gmail.com');
  final passC = TextEditingController(text: '123123');

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
