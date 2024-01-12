import 'package:get/get.dart';
import 'package:shop/controller/category_controller.dart';
import 'package:shop/controller/dasdboard_controller.dart';
import 'package:shop/controller/home_controller.dart';
import 'package:shop/controller/product_controllers.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(ProductController());
    Get.put(DasdboardController());
    Get.put(CategoryController());
  }

}