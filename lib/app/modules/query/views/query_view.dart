import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/query/controllers/query_controller.dart';

class QueryView extends GetView<QueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query View'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => controller.filter(),
        child: Text('Filter', style: TextStyle(fontSize: 20)),
      )),
    );
  }
}
