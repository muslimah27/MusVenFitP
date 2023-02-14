import 'package:get/get.dart';

import '../controllers/detail_able_ballet_controller.dart';

class DetailAbleBalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAbleBalletController>(
      () => DetailAbleBalletController(),
    );
  }
}
