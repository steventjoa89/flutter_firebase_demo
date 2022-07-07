import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameC;
  late TextEditingController priceC;

  Future<DocumentSnapshot<Object?>> getDataById(String docId) async {
    DocumentReference product = firestore.collection('products').doc(docId);
    return product.get();
  }

  void editProduct(String name, String price, String docId) async {
    try {
      DocumentReference docData = firestore.collection('products').doc(docId);

      await docData.update({"name": name, "price": price});

      Get.defaultDialog(
        title: "Berhasil",
        middleText: 'Berhasil mengubah product',
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
        middleText: 'Gagal mengubah product',
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
