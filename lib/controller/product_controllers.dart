import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/device/remote_product.dart';

import '../model/product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchEditController = TextEditingController();
  RxString searchVal = ''.obs;
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

  void getProductByName({required String keyword}) async {
    try{
      isProductLoading(true);
      var rs = await RemoteProductService().getByName(keyword: keyword);
      if(rs != null){
        productList.assignAll(ProductListFromJson(rs.body));
      }
    }
    finally{
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByCategory({required int id}) async {
    try{
      isProductLoading(true);
      var rs = await RemoteProductService().getByCategory(id: id);
      if(rs != null){
        productList.assignAll(ProductListFromJson(rs.body));
      }
    }
    finally{
      isProductLoading(false);
      print(productList.length);
    }
  }
}
