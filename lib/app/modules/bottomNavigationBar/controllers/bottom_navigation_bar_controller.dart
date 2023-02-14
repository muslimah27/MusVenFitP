import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  // TODO: Implement BottomNavigationBarController

  final count = 0.obs;
  var tabIndex = 0;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    // debugPrint("ini ke-$index");
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
