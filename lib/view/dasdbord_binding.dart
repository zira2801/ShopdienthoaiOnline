import 'package:get/get.dart';
import 'package:shop/controller/home_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}