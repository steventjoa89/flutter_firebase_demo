import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/store/controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Store view'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.uploadString(),
      ),
    );
  }
}
