import 'package:get/get.dart';
import 'package:shop/device/remote_banner.dart';
import 'package:shop/device/remote_category.dart';
import 'package:shop/device/remote_product_phobien.dart';
import 'package:shop/model/ad_banner.dart';
import 'package:shop/model/category.dart';
import 'package:shop/model/product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> PhoBiencategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> PhoBienproductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isCategoryPhoBienLoading = false.obs;
  RxBool isProductPhoBienLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getAdBanners();
    getCategory();
    getProductPhoBien();
    super.onInit();
  }
  void getAdBanners() async{
    try{
    isBannerLoading(true);
    var result = await RemoteBannerService().get();
    if(result != null){
      bannerList.assignAll(adBannerListFromJson(result.body));
    }
    }
    finally{
      print(bannerList.length);
      isBannerLoading(false);
    }
  }

  void getCategory() async{
    try{
      isCategoryPhoBienLoading(true);
      var result = await RemoteCategory().get();
      if(result != null){
        PhoBiencategoryList.assignAll(CategoryListFromJson(result.body));
      }
    }
    finally{
      print(PhoBiencategoryList.length);
      isCategoryPhoBienLoading(false);
    }
  }

  void getProductPhoBien() async{
    try{
      isProductPhoBienLoading(true);
      var result = await RemoteProductPhobien().get();
      if(result != null){
        PhoBienproductList.assignAll(ProductPhoBienListFromJson(result.body));
      }
    }
    finally{
      print(PhoBienproductList.length);
      isProductPhoBienLoading(false);
    }
  }
}
