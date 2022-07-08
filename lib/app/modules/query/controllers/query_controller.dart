import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter() async {
    final result =
        // await firestore.collection('users').where('age', isEqualTo: 32).get();
        await firestore
            .collection('users')
            // .where('mobil', arrayContains: 'toyota')
            .orderBy('name')
            .startAt(['novi'])
            // .limitToLast(2)
            .get();

    if (result.docs.length > 0) {
      print('Total data filter: ${result.docs.length}');
      result.docs.forEach((element) {
        print('Data: ${element.data()}');
      });
    }
  }
}
