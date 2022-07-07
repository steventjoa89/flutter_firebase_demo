import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  final emailC = TextEditingController(text: 'test1@gmail.com');
  final passC = TextEditingController(text: '123123');

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
