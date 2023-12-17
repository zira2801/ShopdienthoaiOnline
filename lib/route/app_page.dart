import 'package:get/get.dart';
import 'package:shop/route/app_route.dart';
import 'package:shop/view/dasdboardscreen.dart';

class AppPage{
  static var list =[
    GetPage(name: AppRoute.dasdboard, page: () => const DashboardScreen())
  ];
}