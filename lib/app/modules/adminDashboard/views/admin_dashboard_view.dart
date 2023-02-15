import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/admin/views/admin_view.dart';
import 'package:meditation_app/app/modules/editDance/views/edit_dance_view.dart';
import 'package:meditation_app/app/modules/editInfo/views/edit_info_view.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  @override
  Widget build(BuildContext context) {
    // Get.put(BottomNavigationBarController());
    Get.put(AdminDashboardController(), permanent: true);
    return GetBuilder<AdminDashboardController>(
      init: AdminDashboardController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  AdminView(),
                  EditDanceView(),
                  EditInfoView(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 228, 125, 125),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: controller.tabIndex,
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                  label: 'Dance',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.light_sharp,
                      color: Colors.white,
                    ),
                    label: 'Jadwal'),
              ],
            ));
      },
    );
  }
}
