import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection('products');
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection('products');
    return products
        // .where('price', isGreaterThan: 20)
        .orderBy('time', descending: true)
        .snapshots();
  }

  void deleteById(String docId) async {
    print(docId);
    DocumentReference docRef = firestore.collection('products').doc(docId);

    try {
      Get.defaultDialog(
        title: "Delete Data",
        middleText: 'Apa kamu yakin menghapus data?',
        textCancel: 'No',
        textConfirm: 'Ya',
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: 'Gagal menghapus data',
      );
    }
  }
}
