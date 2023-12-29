import 'package:get/get.dart';
import 'package:shop/device/remote_product.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
  void getProducts() async{
    try {
      isProductLoading(true);
      var rs = await RemoteProductService().get();
      if(rs != null){
        productList.assignAll(ProductListFromJson(rs.body));
      }
    }
    finally{
      isProductLoading(false);
      print(productList.length);
    }}
}
