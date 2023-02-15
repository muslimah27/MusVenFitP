import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_info_controller.dart';

class EditInfoView extends GetView<EditInfoController> {
  const EditInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
