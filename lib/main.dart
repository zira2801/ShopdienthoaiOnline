import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop/page/homepage.dart';
import 'package:shop/route/app_page.dart';
import 'package:shop/route/app_route.dart';
import 'package:shop/view/dasdbord_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialBinding: DashboardBinding(),
      initialRoute: AppRoute.dasdboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
