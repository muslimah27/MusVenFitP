import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meditation_app/app/modules/bottomNavigationBar/controllers/bottom_navigation_bar_controller.dart';
import 'package:meditation_app/app/modules/detail_able_ballet/controllers/detail_able_ballet_controller.dart';
import 'package:meditation_app/firebase_options.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(DetailAbleBalletController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
