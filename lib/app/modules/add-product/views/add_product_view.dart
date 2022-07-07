import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/add-product/controllers/add_product_controller.dart';
import 'package:my_app/app/routes/routes.dart';

class AddProductView extends GetView<AddProductController> {
  // final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.priceC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                  controller.nameC.text, controller.priceC.text),
              // authC.login(controller.emailC.text, controller.passC.text),
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
