import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/adminDashboard/bindings/admin_dashboard_binding.dart';
import '../modules/adminDashboard/views/admin_dashboard_view.dart';
import '../modules/bottomNavigationBar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/bottomNavigationBar/views/bottom_navigation_bar_view.dart';
import '../modules/detail_able_ballet/bindings/detail_able_ballet_binding.dart';
import '../modules/detail_able_ballet/views/detail_able_ballet_view.dart';
import '../modules/editDance/bindings/edit_dance_binding.dart';
import '../modules/editDance/views/edit_dance_view.dart';
import '../modules/editInfo/bindings/edit_info_binding.dart';
import '../modules/editInfo/views/edit_info_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/userProfile/bindings/user_profile_binding.dart';
import '../modules/userProfile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ABLE_BALLET,
      page: () => DetailAbleBalletView(),
      binding: DetailAbleBalletBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DANCE,
      page: () => const EditDanceView(),
      binding: EditDanceBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_INFO,
      page: () => const EditInfoView(),
      binding: EditInfoBinding(),
    ),
  ];
}
