import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  //TODO: Implement AdminDashboardController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void increment() => count.value++;
}
