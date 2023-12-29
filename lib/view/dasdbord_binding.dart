import 'package:get/get.dart';
import 'package:shop/controller/home_controller.dart';
import 'package:shop/controller/product_controllers.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(ProductController());
  }

}