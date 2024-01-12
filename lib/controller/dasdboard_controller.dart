import 'package:get/get.dart';

class DasdboardController extends GetxController{
  static DasdboardController instance = Get.find();
  var selectedIndex = 0;

  void setTab(int index) {
    selectedIndex = index;
    update();
  }
}