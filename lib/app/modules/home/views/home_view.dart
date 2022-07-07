import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/app/utils/loading.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home App'),
        actions: [
          IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
        ],
      ),
      // ONE TIME GET DATA FROM FIRESTORE
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: controller.getData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         var listAllDocus = snapshot.data!.docs;
      //         return ListView.builder(
      //           itemCount: listAllDocus.length,
      //           itemBuilder: (context, index) => ListTile(
      //             title: Text(
      //                 '${(listAllDocus[index].data() as Map<String, dynamic>)['name']}'),
      //             subtitle: Text(
      //                 'Rp: ${(listAllDocus[index].data() as Map<String, dynamic>)['price']}'),
      //           ),
      //         );
      //       }
      //       return LoadingView();
      //     }),

      // REALTIME GET DATA FROM DATABASE
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(Routes.EDIT_PRODUCT,
                    arguments: listAllDocs[index].id),
                title: Text(
                    '${(listAllDocs[index].data() as Map<String, dynamic>)['name']}'),
                subtitle: Text(
                    'Rp: ${(listAllDocs[index].data() as Map<String, dynamic>)['price']}'),
              ),
            );
          }
          return LoadingView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
