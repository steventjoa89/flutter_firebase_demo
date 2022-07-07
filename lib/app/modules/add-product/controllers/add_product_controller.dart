import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameC;
  late TextEditingController priceC;

  void addProduct(String name, String price) async {
    try {
      CollectionReference products = firestore.collection('products');
      await products.add({"name": name, "price": price});
      Get.defaultDialog(
        title: "Berhasil",
        middleText: 'Berhasil menambahkan product',
        textConfirm: 'Ok',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: 'Gagal menambahkan product',
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
