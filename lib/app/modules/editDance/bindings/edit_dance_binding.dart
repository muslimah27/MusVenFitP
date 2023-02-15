import 'package:get/get.dart';

import '../controllers/edit_dance_controller.dart';

class EditDanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDanceController>(
      () => EditDanceController(),
    );
  }
}
