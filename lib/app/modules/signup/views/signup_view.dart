import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:my_app/app/routes/routes.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
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
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () =>
                  authC.signup(controller.emailC.text, controller.passC.text),
              child: Text('Register'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah punya Account?'),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('LOGIN'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
