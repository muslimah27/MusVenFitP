import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/jadwal/views/jadwal_view.dart';
import 'package:meditation_app/app/modules/userProfile/views/user_profile_view.dart';

import '../../home/views/home_view.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  // const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(BottomNavigationBarController());
    Get.put(BottomNavigationBarController(), permanent: true);
    return GetBuilder<BottomNavigationBarController>(
      init: BottomNavigationBarController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomeView(),
                  JadwalView(),
                  UserProfileView(),
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
                  label: 'Jadwal',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: 'Account'),
              ],
            ));
      },
    );
  }
}
