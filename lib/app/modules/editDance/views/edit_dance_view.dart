import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_dance_controller.dart';

class EditDanceView extends GetView<EditDanceController> {
  const EditDanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditDanceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditDanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
