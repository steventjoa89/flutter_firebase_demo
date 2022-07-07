import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/login/controllers/login_controller.dart';
import 'package:my_app/app/routes/routes.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 50),
            TextField(
              controller: controller.passC,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                    child: Text('Reset Password'))),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () =>
                  authC.login(controller.emailC.text, controller.passC.text),
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya account?'),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text('Daftar sekarang'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
