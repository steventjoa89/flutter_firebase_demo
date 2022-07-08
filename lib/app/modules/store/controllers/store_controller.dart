import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class StoreController extends GetxController {
  fs.FirebaseStorage storage = fs.FirebaseStorage.instance;

  void accessStore() async {
    var myRef = storage.ref('');
    // var myRef2 = storage.ref().child('logo').child('wallpaper.jpg');

    var myList = await myRef.listAll();
    print('Total data: ${myList.items.length}');
    myList.items.forEach((element) async {
      final url = await storage.ref(element.name).getDownloadURL();
      print(url);
    });
  }

  void uploadString() async {
    // String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';
    // var myRef = storage.ref('hello.txt');
    // myRef.putString(dataUrl, format: s.PutStringFormat.dataUrl);

    // Raw Data
    // String text = 'Hello, World';
    // List<int> encoded = utf8.encode(text);
    // Uint8List data = Uint8List.fromList(encoded);

    // s.Reference ref = s.FirebaseStorage.instance.ref('uploads/hello-world.txt');

    // await ref.putData(data);

    var myRef = storage.ref('hello-with-metadata.txt');

    fs.SettableMetadata metadata = fs.SettableMetadata(
        cacheControl: 'max-age=60',
        customMetadata: <String, String>{
          'userId': 'ASDFG',
        });
    myRef.putString('Hello world', metadata: metadata);
  }
}
