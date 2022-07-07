import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/reset_password/controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => authC.resetPassword(controller.emailC.text),
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
