import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/edit-product/controllers/edit_product_controller.dart';
import 'package:my_app/app/routes/routes.dart';
import 'package:my_app/app/utils/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductView extends GetView<EditProductController> {
  // final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getDataById(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.nameC.text = data['name'];
              controller.priceC.text = data['price'];

              return Padding(
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
                      onPressed: () {
                        controller.editProduct(controller.nameC.text,
                            controller.priceC.text, Get.arguments);
                      },
                      child: Text('Update Product'),
                    ),
                  ],
                ),
              );
            }
            return Center(child: LoadingView());
          }),
    );
  }
}
